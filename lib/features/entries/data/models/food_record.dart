import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_record.g.dart';
part 'food_record.freezed.dart';

@freezed
abstract class FoodRecord with _$FoodRecord {
  const factory FoodRecord({
    required String name,
    required double calories,
    required double portionSize,
    required double carbs,
    required double protein,
    required double fat,
    int? id,
    DateTime? createdAt,
  }) = _FoodRecord;

  const FoodRecord._();

  factory FoodRecord.fromJson(Map<String, dynamic> json) => _$FoodRecordFromJson(json);

  double get totalCalories => calories * portionSize;
  double get totalCarbs => carbs * portionSize;
  double get totalProtein => protein * portionSize;
  double get totalFat => fat * portionSize;
}
