import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'dart:math';

abstract class LiveSessionRemoteDataSource {
  Future<String> generateSessionToken({
    required String userId,
    required String sessionId,
  });
  
  Future<String> createLiveSession({
    required String trainerId,
    required String classId,
    required String title,
    required DateTime scheduledTime,
    required int durationMinutes,
  });
  
  Future<Map<String, dynamic>> joinLiveSession({
    required String sessionId,
    required String userId,
    required String userName,
  });
  
  Future<void> endLiveSession(String sessionId);
  Future<Map<String, dynamic>> getSessionDetails(String sessionId);
  Future<List<Map<String, dynamic>>> getTrainerLiveSessions(String trainerId);
  Future<List<Map<String, dynamic>>> getStudentUpcomingSessions(String studentId);
}

class LiveSessionRemoteDataSourceImpl implements LiveSessionRemoteDataSource {
  final SupabaseClient _supabaseClient;
  
  // Zego Cloud configuration
  static const String _zegoAppId = "1484647939"; // Demo App ID
  // Note: App Sign can be used for server-side token generation if needed
  
  LiveSessionRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<String> generateSessionToken({
    required String userId,
    required String sessionId,
  }) async {
    // For simplicity, we'll use a basic token generation
    // In production, this should be done securely on the server
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final nonce = Random().nextInt(1000000);
    
    // Generate a simple token for demo purposes
    final tokenData = {
      'appId': _zegoAppId,
      'userId': userId,
      'sessionId': sessionId,
      'timestamp': timestamp,
      'nonce': nonce,
    };
    
    return base64Encode(utf8.encode(json.encode(tokenData)));
  }

  @override
  Future<String> createLiveSession({
    required String trainerId,
    required String classId,
    required String title,
    required DateTime scheduledTime,
    required int durationMinutes,
  }) async {
    try {
      final sessionId = const Uuid().v4();
      
      final sessionData = {
        'id': sessionId,
        'trainer_id': trainerId,
        'class_id': classId,
        'title': title,
        'scheduled_time': scheduledTime.toIso8601String(),
        'duration_minutes': durationMinutes,
        'status': 'scheduled',
        'zego_room_id': sessionId,
        'created_at': DateTime.now().toIso8601String(),
      };

      await _supabaseClient
          .from('live_sessions')
          .insert(sessionData);

      return sessionId;
    } catch (e) {
      throw Exception('Failed to create live session: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> joinLiveSession({
    required String sessionId,
    required String userId,
    required String userName,
  }) async {
    try {
      // Get session details
      final session = await _supabaseClient
          .from('live_sessions')
          .select('*')
          .eq('id', sessionId)
          .single();

      // Generate token for the session
      final token = await generateSessionToken(
        userId: userId,
        sessionId: sessionId,
      );

      // Record attendance
      await _supabaseClient
          .from('session_attendees')
          .upsert({
            'session_id': sessionId,
            'user_id': userId,
            'user_name': userName,
            'joined_at': DateTime.now().toIso8601String(),
          });

      return {
        'sessionId': sessionId,
        'token': token,
        'appId': _zegoAppId,
        'roomId': session['zego_room_id'],
        'userId': userId,
        'userName': userName,
        'sessionTitle': session['title'],
      };
    } catch (e) {
      throw Exception('Failed to join live session: $e');
    }
  }

  @override
  Future<void> endLiveSession(String sessionId) async {
    try {
      await _supabaseClient
          .from('live_sessions')
          .update({
            'status': 'completed',
            'ended_at': DateTime.now().toIso8601String(),
          })
          .eq('id', sessionId);
    } catch (e) {
      throw Exception('Failed to end live session: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> getSessionDetails(String sessionId) async {
    try {
      final session = await _supabaseClient
          .from('live_sessions')
          .select('''
            *,
            trainers!inner(full_name),
            classes!inner(title, description)
          ''')
          .eq('id', sessionId)
          .single();

      return session;
    } catch (e) {
      throw Exception('Failed to get session details: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getTrainerLiveSessions(String trainerId) async {
    try {
      final sessions = await _supabaseClient
          .from('live_sessions')
          .select('''
            *,
            classes!inner(title, description)
          ''')
          .eq('trainer_id', trainerId)
          .order('scheduled_time', ascending: false);

      return List<Map<String, dynamic>>.from(sessions);
    } catch (e) {
      throw Exception('Failed to get trainer live sessions: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getStudentUpcomingSessions(String studentId) async {
    try {
      final sessions = await _supabaseClient
          .from('live_sessions')
          .select('''
            *,
            classes!inner(
              title,
              description,
              enrollments!inner(student_id)
            ),
            trainers!inner(full_name)
          ''')
          .eq('classes.enrollments.student_id', studentId)
          .gte('scheduled_time', DateTime.now().toIso8601String())
          .eq('status', 'scheduled')
          .order('scheduled_time', ascending: true);

      return List<Map<String, dynamic>>.from(sessions);
    } catch (e) {
      throw Exception('Failed to get student upcoming sessions: $e');
    }
  }
} 