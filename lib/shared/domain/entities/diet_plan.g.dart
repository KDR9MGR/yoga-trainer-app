// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DietPlanImpl _$$DietPlanImplFromJson(Map<String, dynamic> json) =>
    _$DietPlanImpl(
      id: json['id'] as String,
      trainerId: json['trainerId'] as String,
      clientId: json['clientId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      goal: json['goal'] as String,
      dailyCalories: (json['dailyCalories'] as num).toInt(),
      macros: json['macros'] as Map<String, dynamic>,
      mealPlans:
          (json['mealPlans'] as List<dynamic>)
              .map((e) => DietMealPlan.fromJson(e as Map<String, dynamic>))
              .toList(),
      restrictions:
          (json['restrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$DietPlanImplToJson(_$DietPlanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trainerId': instance.trainerId,
      'clientId': instance.clientId,
      'title': instance.title,
      'description': instance.description,
      'goal': instance.goal,
      'dailyCalories': instance.dailyCalories,
      'macros': instance.macros,
      'mealPlans': instance.mealPlans,
      'restrictions': instance.restrictions,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$DietMealPlanImpl _$$DietMealPlanImplFromJson(Map<String, dynamic> json) =>
    _$DietMealPlanImpl(
      mealType: json['mealType'] as String,
      items:
          (json['items'] as List<dynamic>)
              .map((e) => DietMealItem.fromJson(e as Map<String, dynamic>))
              .toList(),
      calories: (json['calories'] as num).toInt(),
    );

Map<String, dynamic> _$$DietMealPlanImplToJson(_$DietMealPlanImpl instance) =>
    <String, dynamic>{
      'mealType': instance.mealType,
      'items': instance.items,
      'calories': instance.calories,
    };

_$DietMealItemImpl _$$DietMealItemImplFromJson(Map<String, dynamic> json) =>
    _$DietMealItemImpl(
      foodName: json['foodName'] as String,
      quantity: json['quantity'] as String,
      calories: (json['calories'] as num).toInt(),
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fats: (json['fats'] as num).toDouble(),
    );

Map<String, dynamic> _$$DietMealItemImplToJson(_$DietMealItemImpl instance) =>
    <String, dynamic>{
      'foodName': instance.foodName,
      'quantity': instance.quantity,
      'calories': instance.calories,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fats': instance.fats,
    };
