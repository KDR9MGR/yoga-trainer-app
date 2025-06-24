import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainer_manager_pro/core/network/network_info.dart';
import 'package:trainer_manager_pro/core/network/supabase_client.dart';
import 'package:trainer_manager_pro/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:trainer_manager_pro/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trainer_manager_pro/features/auth/domain/repositories/auth_repository.dart';

// Core providers
final supabaseServiceProvider = Provider<SupabaseService>((ref) {
  return SupabaseService.instance;
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl();
});

// Auth providers
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final supabaseService = ref.read(supabaseServiceProvider);
  return AuthRemoteDataSourceImpl(supabaseService);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.read(authRemoteDataSourceProvider);
  final networkInfo = ref.read(networkInfoProvider);
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
}); 