import 'package:supabase_flutter/supabase_flutter.dart' hide AuthUser;
import 'package:trainer_manager_pro/core/network/supabase_client.dart';
import 'package:trainer_manager_pro/features/auth/data/models/auth_user_model.dart';
import 'package:trainer_manager_pro/features/auth/domain/entities/auth_user.dart';

/// Abstract auth remote data source
abstract class AuthRemoteDataSource {
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required bool isTrainer,
  });
  
  Future<AuthUser> signInWithGoogle();
  
  Future<void> signOut();
  
  Future<AuthUser?> getCurrentUser();
  
  bool isSignedIn();
  
  Stream<AuthUser?> get authStateChanges;
}

/// Implementation of auth remote data source
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseService _supabaseService;
  
  AuthRemoteDataSourceImpl(this._supabaseService);
  
  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabaseService.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      
      if (response.user == null) {
        throw Exception('Sign in failed');
      }
      
      return AuthUserModel.fromUser(response.user!);
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }
  
  @override
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required bool isTrainer,
  }) async {
    try {
      final response = await _supabaseService.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
          'is_trainer': isTrainer,
        },
      );
      
      if (response.user == null) {
        throw Exception('Sign up failed');
      }
      
      return AuthUserModel.fromUser(response.user!);
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }
  
  @override
  Future<AuthUser> signInWithGoogle() async {
    try {
      await _supabaseService.client.auth.signInWithOAuth(
        OAuthProvider.google,
      );
      
      // Note: OAuth flow might require additional handling
      throw UnimplementedError('Google sign in needs to be configured');
    } catch (e) {
      throw Exception('Google sign in failed: $e');
    }
  }
  
  @override
  Future<void> signOut() async {
    try {
      await _supabaseService.client.auth.signOut();
    } catch (e) {
      throw Exception('Sign out failed: $e');
    }
  }
  
  @override
  Future<AuthUser?> getCurrentUser() async {
    try {
      final user = _supabaseService.currentUser;
      if (user == null) return null;
      
      return AuthUserModel.fromUser(user);
    } catch (e) {
      throw Exception('Get current user failed: $e');
    }
  }
  
  @override
  bool isSignedIn() {
    return _supabaseService.isSignedIn;
  }
  
  @override
  Stream<AuthUser?> get authStateChanges {
    return _supabaseService.client.auth.onAuthStateChange.map((data) {
      final user = data.session?.user;
      return user != null ? AuthUserModel.fromUser(user) : null;
    });
  }
} 