import 'package:dartz/dartz.dart';
import 'package:trainer_manager_pro/core/errors/failures.dart';
import 'package:trainer_manager_pro/features/diet_plans/data/datasources/diet_plan_remote_data_source.dart';
import 'package:trainer_manager_pro/features/diet_plans/domain/repositories/diet_plan_repository.dart';
import 'package:trainer_manager_pro/shared/domain/entities/diet_plan.dart';

class DietPlanRepositoryImpl implements DietPlanRepository {
  final DietPlanRemoteDataSource _remoteDataSource;

  DietPlanRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<DietPlan>>> getTrainerDietPlans(String trainerId) async {
    try {
      final dietPlans = await _remoteDataSource.getTrainerDietPlans(trainerId);
      return Right(dietPlans);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DietPlan>>> getClientDietPlans(String clientId) async {
    try {
      final dietPlans = await _remoteDataSource.getClientDietPlans(clientId);
      return Right(dietPlans);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DietPlan>> createDietPlan(DietPlan dietPlan) async {
    try {
      final createdPlan = await _remoteDataSource.createDietPlan(dietPlan);
      return Right(createdPlan);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DietPlan>> updateDietPlan(DietPlan dietPlan) async {
    try {
      final updatedPlan = await _remoteDataSource.updateDietPlan(dietPlan);
      return Right(updatedPlan);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDietPlan(String dietPlanId) async {
    try {
      await _remoteDataSource.deleteDietPlan(dietPlanId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DietPlan>> getDietPlan(String dietPlanId) async {
    try {
      final dietPlan = await _remoteDataSource.getDietPlan(dietPlanId);
      return Right(dietPlan);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
} 