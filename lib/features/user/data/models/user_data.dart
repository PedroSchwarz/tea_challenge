import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';
part 'user_data.freezed.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required String name,
    required double caloriesGoal,
    required double carbsGoal,
    required double proteinGoal,
    required double fatGoal,
    required double waterGoal,
    required bool wasUpdated,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
