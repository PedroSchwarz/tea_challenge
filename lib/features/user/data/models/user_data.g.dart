// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  name: json['name'] as String,
  caloriesGoal: (json['caloriesGoal'] as num).toDouble(),
  carbsGoal: (json['carbsGoal'] as num).toDouble(),
  proteinGoal: (json['proteinGoal'] as num).toDouble(),
  fatGoal: (json['fatGoal'] as num).toDouble(),
  waterGoal: (json['waterGoal'] as num).toDouble(),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'name': instance.name,
  'caloriesGoal': instance.caloriesGoal,
  'carbsGoal': instance.carbsGoal,
  'proteinGoal': instance.proteinGoal,
  'fatGoal': instance.fatGoal,
  'waterGoal': instance.waterGoal,
};
