// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WaterRecord _$WaterRecordFromJson(Map<String, dynamic> json) => _WaterRecord(
  amountInMl: (json['amountInMl'] as num).toDouble(),
  id: (json['id'] as num?)?.toInt(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$WaterRecordToJson(_WaterRecord instance) =>
    <String, dynamic>{
      'amountInMl': instance.amountInMl,
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
