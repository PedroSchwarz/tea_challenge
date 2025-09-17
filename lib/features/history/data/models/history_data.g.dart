// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryData _$HistoryDataFromJson(Map<String, dynamic> json) => _HistoryData(
  date: DateTime.parse(json['date'] as String),
  caloriesProgress: (json['caloriesProgress'] as num).toDouble(),
  waterProgress: (json['waterProgress'] as num).toDouble(),
);

Map<String, dynamic> _$HistoryDataToJson(_HistoryData instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'caloriesProgress': instance.caloriesProgress,
      'waterProgress': instance.waterProgress,
    };
