import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:trainer_manager_pro/shared/domain/entities/diet_plan.dart';

abstract class DietPlanRemoteDataSource {
  Future<List<DietPlan>> getTrainerDietPlans(String trainerId);
  Future<List<DietPlan>> getClientDietPlans(String clientId);
  Future<DietPlan> createDietPlan(DietPlan dietPlan);
  Future<DietPlan> updateDietPlan(DietPlan dietPlan);
  Future<void> deleteDietPlan(String dietPlanId);
  Future<DietPlan> getDietPlan(String dietPlanId);
}

class DietPlanRemoteDataSourceImpl implements DietPlanRemoteDataSource {
  final SupabaseClient _supabaseClient;

  DietPlanRemoteDataSourceImpl(this._supabaseClient);

  @override
  Future<List<DietPlan>> getTrainerDietPlans(String trainerId) async {
    try {
      final response = await _supabaseClient
          .from('diet_templates')
          .select('''
            *,
            clients!inner(
              id,
              student_id,
              students!inner(full_name, email)
            )
          ''')
          .eq('trainer_id', trainerId)
          .order('created_at', ascending: false);

      return response.map<DietPlan>((json) => DietPlan.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch trainer diet plans: $e');
    }
  }

  @override
  Future<List<DietPlan>> getClientDietPlans(String clientId) async {
    try {
      final response = await _supabaseClient
          .from('diet_templates')
          .select('*')
          .eq('client_id', clientId)
          .order('created_at', ascending: false);

      return response.map<DietPlan>((json) => DietPlan.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch client diet plans: $e');
    }
  }

  @override
  Future<DietPlan> createDietPlan(DietPlan dietPlan) async {
    try {
      final response = await _supabaseClient
          .from('diet_templates')
          .insert(dietPlan.toJson())
          .select()
          .single();

      return DietPlan.fromJson(response);
    } catch (e) {
      throw Exception('Failed to create diet plan: $e');
    }
  }

  @override
  Future<DietPlan> updateDietPlan(DietPlan dietPlan) async {
    try {
      final response = await _supabaseClient
          .from('diet_templates')
          .update(dietPlan.toJson())
          .eq('id', dietPlan.id)
          .select()
          .single();

      return DietPlan.fromJson(response);
    } catch (e) {
      throw Exception('Failed to update diet plan: $e');
    }
  }

  @override
  Future<void> deleteDietPlan(String dietPlanId) async {
    try {
      await _supabaseClient
          .from('diet_templates')
          .delete()
          .eq('id', dietPlanId);
    } catch (e) {
      throw Exception('Failed to delete diet plan: $e');
    }
  }

  @override
  Future<DietPlan> getDietPlan(String dietPlanId) async {
    try {
      final response = await _supabaseClient
          .from('diet_templates')
          .select('*')
          .eq('id', dietPlanId)
          .single();

      return DietPlan.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch diet plan: $e');
    }
  }
} 