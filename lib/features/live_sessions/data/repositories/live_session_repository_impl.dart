import 'package:dartz/dartz.dart';
import 'package:trainer_manager_pro/core/errors/failures.dart';
import 'package:trainer_manager_pro/features/live_sessions/data/datasources/live_session_remote_data_source.dart';
import 'package:trainer_manager_pro/features/live_sessions/domain/repositories/live_session_repository.dart';

class LiveSessionRepositoryImpl implements LiveSessionRepository {
  final LiveSessionRemoteDataSource _remoteDataSource;

  LiveSessionRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, String>> generateSessionToken({
    required String userId,
    required String sessionId,
  }) async {
    try {
      final token = await _remoteDataSource.generateSessionToken(
        userId: userId,
        sessionId: sessionId,
      );
      return Right(token);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createLiveSession({
    required String trainerId,
    required String classId,
    required String title,
    required DateTime scheduledTime,
    required int durationMinutes,
  }) async {
    try {
      final sessionId = await _remoteDataSource.createLiveSession(
        trainerId: trainerId,
        classId: classId,
        title: title,
        scheduledTime: scheduledTime,
        durationMinutes: durationMinutes,
      );
      return Right(sessionId);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> joinLiveSession({
    required String sessionId,
    required String userId,
    required String userName,
  }) async {
    try {
      final sessionData = await _remoteDataSource.joinLiveSession(
        sessionId: sessionId,
        userId: userId,
        userName: userName,
      );
      return Right(sessionData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> endLiveSession(String sessionId) async {
    try {
      await _remoteDataSource.endLiveSession(sessionId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getSessionDetails(String sessionId) async {
    try {
      final sessionDetails = await _remoteDataSource.getSessionDetails(sessionId);
      return Right(sessionDetails);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getTrainerLiveSessions(String trainerId) async {
    try {
      final sessions = await _remoteDataSource.getTrainerLiveSessions(trainerId);
      return Right(sessions);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getStudentUpcomingSessions(String studentId) async {
    try {
      final sessions = await _remoteDataSource.getStudentUpcomingSessions(studentId);
      return Right(sessions);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
} 