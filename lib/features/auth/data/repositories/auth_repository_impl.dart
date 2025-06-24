import 'package:dartz/dartz.dart';
import 'package:trainer_manager_pro/core/errors/failures.dart';
import 'package:trainer_manager_pro/core/network/network_info.dart';
import 'package:trainer_manager_pro/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:trainer_manager_pro/features/auth/domain/entities/auth_user.dart';
import 'package:trainer_manager_pro/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthUser>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        return Right(user);
      } catch (e) {
        return Left(Failure.authFailure(e.toString()));
      }
    } else {
      return const Left(Failure.connectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required bool isTrainer,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signUpWithEmailAndPassword(
          email: email,
          password: password,
          fullName: fullName,
          isTrainer: isTrainer,
        );
        return Right(user);
      } catch (e) {
        return Left(Failure.authFailure(e.toString()));
      }
    } else {
      return const Left(Failure.connectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signInWithGoogle() async {
    if (await networkInfo.isConnected) {
      try {
        final user = await remoteDataSource.signInWithGoogle();
        return Right(user);
      } catch (e) {
        return Left(Failure.authFailure(e.toString()));
      }
    } else {
      return const Left(Failure.connectionFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await remoteDataSource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure.authFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthUser?>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user);
    } catch (e) {
      return Left(Failure.authFailure(e.toString()));
    }
  }

  @override
  bool isSignedIn() {
    return remoteDataSource.isSignedIn();
  }

  @override
  Stream<AuthUser?> get authStateChanges {
    return remoteDataSource.authStateChanges;
  }
} 