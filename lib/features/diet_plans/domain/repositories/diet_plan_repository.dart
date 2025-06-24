import 'package:dartz/dartz.dart';
import 'package:trainer_manager_pro/core/errors/failures.dart';
import 'package:trainer_manager_pro/shared/domain/entities/diet_plan.dart';

abstract class DietPlanRepository {
  /// Get all diet plans for a trainer
  Future<Either<Failure, List<DietPlan>>> getTrainerDietPlans(String trainerId);
  
  /// Get diet plans for a specific client
  Future<Either<Failure, List<DietPlan>>> getClientDietPlans(String clientId);
  
  /// Create a new diet plan
  Future<Either<Failure, DietPlan>> createDietPlan(DietPlan dietPlan);
  
  /// Update an existing diet plan
  Future<Either<Failure, DietPlan>> updateDietPlan(DietPlan dietPlan);
  
  /// Delete a diet plan
  Future<Either<Failure, void>> deleteDietPlan(String dietPlanId);
  
  /// Get a specific diet plan by ID
  Future<Either<Failure, DietPlan>> getDietPlan(String dietPlanId);
} 