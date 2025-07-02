import 'package:trainer_manager_pro/core/network/supabase_client.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';

Future<void> testSupabaseConnection() async {
  try {
    // Initialize Supabase if not already initialized
    await SupabaseService.initialize();
    
    // Get the client instance
    final client = SupabaseService.instance.client;
    
    // Try to fetch a simple query to validate connection
    final response = await client
        .from('clients')
        .select('id')
        .limit(1)
        .single();
    
    print('✅ Supabase connection test successful!');
    print('Connected to: ${AppConstants.supabaseUrl}');
    print('Using anon key: ${AppConstants.supabaseAnonKey.substring(0, 10)}...');
  } catch (e) {
    print('❌ Supabase connection test failed: $e');
  }
} 