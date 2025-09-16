import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_record.g.dart';
part 'food_record.freezed.dart';

@freezed
abstract class FoodRecord with _$FoodRecord {
  const factory FoodRecord({
    required String name,
    required double caloriesPerPortion,
    required double portionSize,
    required double carbs,
    required double protein,
    required double fat,
    int? id,
    DateTime? createdAt,
  }) = _FoodRecord;

  factory FoodRecord.fromJson(Map<String, dynamic> json) => _$FoodRecordFromJson(json);
}
