import 'package:dartz/dartz.dart';
import 'package:trainer_manager_pro/core/errors/failures.dart';

/// Repository for managing live video sessions
abstract class LiveSessionRepository {
  /// Generate a token for Zego Cloud video session
  Future<Either<Failure, String>> generateSessionToken({
    required String userId,
    required String sessionId,
  });
  
  /// Create a new live session
  Future<Either<Failure, String>> createLiveSession({
    required String trainerId,
    required String classId,
    required String title,
    required DateTime scheduledTime,
    required int durationMinutes,
  });
  
  /// Join an existing live session
  Future<Either<Failure, Map<String, dynamic>>> joinLiveSession({
    required String sessionId,
    required String userId,
    required String userName,
  });
  
  /// End a live session
  Future<Either<Failure, void>> endLiveSession(String sessionId);
  
  /// Get session details
  Future<Either<Failure, Map<String, dynamic>>> getSessionDetails(String sessionId);
  
  /// Get all live sessions for a trainer
  Future<Either<Failure, List<Map<String, dynamic>>>> getTrainerLiveSessions(String trainerId);
  
  /// Get upcoming sessions for a student
  Future<Either<Failure, List<Map<String, dynamic>>>> getStudentUpcomingSessions(String studentId);
} 