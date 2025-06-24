import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/features/diet_plans/data/datasources/diet_plan_remote_data_source.dart';
import 'package:trainer_manager_pro/features/diet_plans/data/repositories/diet_plan_repository_impl.dart';
import 'package:trainer_manager_pro/features/diet_plans/domain/repositories/diet_plan_repository.dart';
import 'package:trainer_manager_pro/shared/domain/entities/diet_plan.dart';

// Providers
final dietPlanRemoteDataSourceProvider = Provider<DietPlanRemoteDataSource>((ref) {
  return DietPlanRemoteDataSourceImpl(Supabase.instance.client);
});

final dietPlanRepositoryProvider = Provider<DietPlanRepository>((ref) {
  return DietPlanRepositoryImpl(ref.read(dietPlanRemoteDataSourceProvider));
});

final trainerDietPlansProvider = FutureProvider.family<List<DietPlan>, String>((ref, trainerId) async {
  final repository = ref.read(dietPlanRepositoryProvider);
  final result = await repository.getTrainerDietPlans(trainerId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (dietPlans) => dietPlans,
  );
});

final clientDietPlansProvider = FutureProvider.family<List<DietPlan>, String>((ref, clientId) async {
  final repository = ref.read(dietPlanRepositoryProvider);
  final result = await repository.getClientDietPlans(clientId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (dietPlans) => dietPlans,
  );
});

final dietPlanProvider = FutureProvider.family<DietPlan, String>((ref, dietPlanId) async {
  final repository = ref.read(dietPlanRepositoryProvider);
  final result = await repository.getDietPlan(dietPlanId);
  return result.fold(
    (failure) => throw Exception(failure.message),
    (dietPlan) => dietPlan,
  );
});

// Controller for managing diet plan operations
class DietPlanController extends StateNotifier<AsyncValue<void>> {
  final DietPlanRepository _repository;
  final Ref _ref;

  DietPlanController(this._repository, this._ref) : super(const AsyncValue.data(null));

  Future<void> createDietPlan(DietPlan dietPlan) async {
    state = const AsyncValue.loading();
    final result = await _repository.createDietPlan(dietPlan);
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (success) {
        state = const AsyncValue.data(null);
        // Invalidate providers to refresh data
        _ref.invalidate(trainerDietPlansProvider);
      },
    );
  }

  Future<void> updateDietPlan(DietPlan dietPlan) async {
    state = const AsyncValue.loading();
    final result = await _repository.updateDietPlan(dietPlan);
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (success) {
        state = const AsyncValue.data(null);
        // Invalidate providers to refresh data
        _ref.invalidate(trainerDietPlansProvider);
        _ref.invalidate(dietPlanProvider);
      },
    );
  }

  Future<void> deleteDietPlan(String dietPlanId) async {
    state = const AsyncValue.loading();
    final result = await _repository.deleteDietPlan(dietPlanId);
    result.fold(
      (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
      (success) {
        state = const AsyncValue.data(null);
        // Invalidate providers to refresh data
        _ref.invalidate(trainerDietPlansProvider);
      },
    );
  }
}

final dietPlanControllerProvider = StateNotifierProvider<DietPlanController, AsyncValue<void>>((ref) {
  return DietPlanController(ref.read(dietPlanRepositoryProvider), ref);
}); 