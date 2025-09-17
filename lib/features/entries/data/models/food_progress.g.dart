// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodProgress _$FoodProgressFromJson(Map<String, dynamic> json) =>
    _FoodProgress(
      totalCalories: (json['totalCalories'] as num).toDouble(),
      totalCarbs: (json['totalCarbs'] as num).toDouble(),
      totalProtein: (json['totalProtein'] as num).toDouble(),
      totalFat: (json['totalFat'] as num).toDouble(),
      caloriesGoal: (json['caloriesGoal'] as num).toDouble(),
      carbsGoal: (json['carbsGoal'] as num).toDouble(),
      proteinGoal: (json['proteinGoal'] as num).toDouble(),
      fatGoal: (json['fatGoal'] as num).toDouble(),
    );

Map<String, dynamic> _$FoodProgressToJson(_FoodProgress instance) =>
    <String, dynamic>{
      'totalCalories': instance.totalCalories,
      'totalCarbs': instance.totalCarbs,
      'totalProtein': instance.totalProtein,
      'totalFat': instance.totalFat,
      'caloriesGoal': instance.caloriesGoal,
      'carbsGoal': instance.carbsGoal,
      'proteinGoal': instance.proteinGoal,
      'fatGoal': instance.fatGoal,
    };
