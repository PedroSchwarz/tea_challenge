import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_progress.g.dart';
part 'food_progress.freezed.dart';

@freezed
abstract class FoodProgress with _$FoodProgress {
  const factory FoodProgress({required double calories, required double carbs, required double protein, required double fat}) = _FoodProgress;

  factory FoodProgress.fromJson(Map<String, dynamic> json) => _$FoodProgressFromJson(json);
}
