import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/features/live_sessions/data/datasources/live_session_remote_data_source.dart';
import 'package:trainer_manager_pro/features/live_sessions/data/repositories/live_session_repository_impl.dart';
import 'package:trainer_manager_pro/features/live_sessions/domain/repositories/live_session_repository.dart';

// Providers
final liveSessionRemoteDataSourceProvider = Provider<LiveSessionRemoteDataSource>((ref) {
  return LiveSessionRemoteDataSourceImpl(Supabase.instance.client);
});

final liveSessionRepositoryProvider = Provider<LiveSessionRepository>((ref) {
  return LiveSessionRepositoryImpl(ref.read(liveSessionRemoteDataSourceProvider));
});

final trainerLiveSessionsProvider = FutureProvider.family<List<Map<String, dynamic>>, String>((ref, trainerId) async {
  final repository = ref.read(liveSessionRepositoryProvider);
  final result = await repository.getTrainerLiveSessions(trainerId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (sessions) => sessions,
  );
});

final studentUpcomingSessionsProvider = FutureProvider.family<List<Map<String, dynamic>>, String>((ref, studentId) async {
  final repository = ref.read(liveSessionRepositoryProvider);
  final result = await repository.getStudentUpcomingSessions(studentId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (sessions) => sessions,
  );
});

final sessionDetailsProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, sessionId) async {
  final repository = ref.read(liveSessionRepositoryProvider);
  final result = await repository.getSessionDetails(sessionId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (sessionDetails) => sessionDetails,
  );
});

// Controller for managing live session operations
class LiveSessionController extends StateNotifier<AsyncValue<void>> {
  final LiveSessionRepository _repository;
  final Ref _ref;

  LiveSessionController(this._repository, this._ref) : super(const AsyncValue.data(null));

  Future<String?> createLiveSession({
    required String trainerId,
    required String classId,
    required String title,
    required DateTime scheduledTime,
    required int durationMinutes,
  }) async {
    state = const AsyncValue.loading();
    final result = await _repository.createLiveSession(
      trainerId: trainerId,
      classId: classId,
      title: title,
      scheduledTime: scheduledTime,
      durationMinutes: durationMinutes,
    );
    
    return result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        return null;
      },
      (sessionId) {
        state = const AsyncValue.data(null);
        // Invalidate providers to refresh data
        _ref.invalidate(trainerLiveSessionsProvider);
        return sessionId;
      },
    );
  }

  Future<Map<String, dynamic>?> joinLiveSession({
    required String sessionId,
    required String userId,
    required String userName,
  }) async {
    state = const AsyncValue.loading();
    final result = await _repository.joinLiveSession(
      sessionId: sessionId,
      userId: userId,
      userName: userName,
    );
    
    return result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
        return null;
      },
      (sessionData) {
        state = const AsyncValue.data(null);
        return sessionData;
      },
    );
  }

  Future<void> endLiveSession(String sessionId) async {
    state = const AsyncValue.loading();
    final result = await _repository.endLiveSession(sessionId);
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (success) {
        state = const AsyncValue.data(null);
        // Invalidate providers to refresh data
        _ref.invalidate(trainerLiveSessionsProvider);
        _ref.invalidate(sessionDetailsProvider);
      },
    );
  }

  Future<String?> generateSessionToken({
    required String userId,
    required String sessionId,
  }) async {
    final result = await _repository.generateSessionToken(
      userId: userId,
      sessionId: sessionId,
    );
    
    return result.fold(
      (failure) => null,
      (token) => token,
    );
  }
}

final liveSessionControllerProvider = StateNotifierProvider<LiveSessionController, AsyncValue<void>>((ref) {
  return LiveSessionController(ref.read(liveSessionRepositoryProvider), ref);
}); 