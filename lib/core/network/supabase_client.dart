import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';

/// Supabase client singleton
class SupabaseService {
  static SupabaseService? _instance;
  static SupabaseService get instance => _instance ??= SupabaseService._();
  
  SupabaseService._();
  
  SupabaseClient get client => Supabase.instance.client;
  
  /// Initialize Supabase
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: AppConstants.supabaseUrl,
      anonKey: AppConstants.supabaseAnonKey,
    );
  }
  
  /// Get current user
  User? get currentUser => client.auth.currentUser;
  
  /// Check if user is signed in
  bool get isSignedIn => currentUser != null;
  
  /// Sign out user
  Future<void> signOut() async {
    await client.auth.signOut();
  }
} 