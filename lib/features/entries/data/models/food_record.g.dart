// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodRecord _$FoodRecordFromJson(Map<String, dynamic> json) => _FoodRecord(
  name: json['name'] as String,
  calories: (json['calories'] as num).toDouble(),
  portionSize: (json['portionSize'] as num).toDouble(),
  carbs: (json['carbs'] as num).toDouble(),
  protein: (json['protein'] as num).toDouble(),
  fat: (json['fat'] as num).toDouble(),
  id: (json['id'] as num?)?.toInt(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$FoodRecordToJson(_FoodRecord instance) =>
    <String, dynamic>{
      'name': instance.name,
      'calories': instance.calories,
      'portionSize': instance.portionSize,
      'carbs': instance.carbs,
      'protein': instance.protein,
      'fat': instance.fat,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
