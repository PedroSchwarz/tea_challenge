// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodEntry _$FoodEntryFromJson(Map<String, dynamic> json) => FoodEntry(
  FoodRecord.fromJson(json['foodRecord'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$FoodEntryToJson(FoodEntry instance) => <String, dynamic>{
  'foodRecord': instance.foodRecord,
  'runtimeType': instance.$type,
};

WaterEntry _$WaterEntryFromJson(Map<String, dynamic> json) => WaterEntry(
  WaterRecord.fromJson(json['waterRecord'] as Map<String, dynamic>),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$WaterEntryToJson(WaterEntry instance) =>
    <String, dynamic>{
      'waterRecord': instance.waterRecord,
      'runtimeType': instance.$type,
    };
