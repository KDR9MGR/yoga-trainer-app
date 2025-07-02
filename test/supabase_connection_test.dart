import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';

void main() {
  test('Validate Supabase credentials', () async {
    try {
      // Create a Supabase client directly without initialization
      final client = SupabaseClient(
        AppConstants.supabaseUrl,
        AppConstants.supabaseAnonKey,
      );
      
      // Try to fetch a simple query to validate connection
      final response = await client
          .from('clients')
          .select('id')
          .limit(1);
      
      print('✅ Supabase connection test successful!');
      print('Connected to: ${AppConstants.supabaseUrl}');
      print('Using anon key: ${AppConstants.supabaseAnonKey.substring(0, 10)}...');
      print('Query response: $response');
      
      // Verify that we have valid connection parameters
      expect(AppConstants.supabaseUrl, isNotEmpty);
      expect(AppConstants.supabaseAnonKey, isNotEmpty);
      expect(response, isNotNull);
      
    } catch (e) {
      print('❌ Supabase connection test failed: $e');
      rethrow;
    }
  });
} 