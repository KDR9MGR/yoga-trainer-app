import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trainer_manager_pro/features/auth/domain/entities/auth_user.dart';
import 'package:trainer_manager_pro/shared/providers/providers.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<AuthUser?> build() async {
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.getCurrentUser();
    
    return result.fold(
      (failure) => throw Exception(failure.message),
      (user) => user,
    );
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required bool isTrainer,
  }) async {
    state = const AsyncValue.loading();
    
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      fullName: fullName,
      isTrainer: isTrainer,
    );
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signInWithGoogle();
    
    state = result.fold(
      (failure) => AsyncValue.error(failure.message, StackTrace.current),
      (user) => AsyncValue.data(user),
    );
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signOut();
    
    result.fold(
      (failure) => throw Exception(failure.message),
      (_) => state = const AsyncValue.data(null),
    );
  }
}

// Provider for auth state stream
@riverpod
Stream<AuthUser?> authStateChanges(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return authRepository.authStateChanges;
} 