// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodProgress _$FoodProgressFromJson(Map<String, dynamic> json) =>
    _FoodProgress(
      calories: (json['calories'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
    );

Map<String, dynamic> _$FoodProgressToJson(_FoodProgress instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'carbs': instance.carbs,
      'protein': instance.protein,
      'fat': instance.fat,
    };
