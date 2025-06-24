import 'package:dartz/dartz.dart';
import 'package:trainer_manager_pro/core/errors/failures.dart';
import 'package:trainer_manager_pro/features/auth/domain/entities/auth_user.dart';

/// Abstract authentication repository
abstract class AuthRepository {
  /// Sign in with email and password
  Future<Either<Failure, AuthUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  
  /// Sign up with email and password
  Future<Either<Failure, AuthUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required bool isTrainer,
  });
  
  /// Sign in with Google
  Future<Either<Failure, AuthUser>> signInWithGoogle();
  
  /// Sign out
  Future<Either<Failure, void>> signOut();
  
  /// Get current user
  Future<Either<Failure, AuthUser?>> getCurrentUser();
  
  /// Check if user is signed in
  bool isSignedIn();
  
  /// Stream of auth state changes
  Stream<AuthUser?> get authStateChanges;
} 