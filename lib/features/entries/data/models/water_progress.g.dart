// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WaterProgress _$WaterProgressFromJson(Map<String, dynamic> json) =>
    _WaterProgress(
      totalAmountInMl: (json['totalAmountInMl'] as num).toDouble(),
      goalInLiters: (json['goalInLiters'] as num).toDouble(),
    );

Map<String, dynamic> _$WaterProgressToJson(_WaterProgress instance) =>
    <String, dynamic>{
      'totalAmountInMl': instance.totalAmountInMl,
      'goalInLiters': instance.goalInLiters,
    };
