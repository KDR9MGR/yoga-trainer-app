import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet_plan.freezed.dart';
part 'diet_plan.g.dart';

@freezed
class DietPlan with _$DietPlan {
  const factory DietPlan({
    required String id,
    required String trainerId,
    required String clientId,
    required String title,
    required String description,
    required String goal, // weight loss, muscle gain, maintenance
    required int dailyCalories,
    required Map<String, dynamic> macros, // protein, carbs, fats percentages
    required List<DietMealPlan> mealPlans,
    List<String>? restrictions, // dietary restrictions
    String? notes,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _DietPlan;

  factory DietPlan.fromJson(Map<String, dynamic> json) => _$DietPlanFromJson(json);
}

@freezed
class DietMealPlan with _$DietMealPlan {
  const factory DietMealPlan({
    required String mealType, // breakfast, lunch, dinner, snack
    required List<DietMealItem> items,
    required int calories,
  }) = _DietMealPlan;

  factory DietMealPlan.fromJson(Map<String, dynamic> json) => _$DietMealPlanFromJson(json);
}

@freezed
class DietMealItem with _$DietMealItem {
  const factory DietMealItem({
    required String foodName,
    required String quantity,
    required int calories,
    required double protein,
    required double carbs,
    required double fats,
  }) = _DietMealItem;

  factory DietMealItem.fromJson(Map<String, dynamic> json) => _$DietMealItemFromJson(json);
} 