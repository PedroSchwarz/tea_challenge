import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';

part 'entry.g.dart';
part 'entry.freezed.dart';

@freezed
abstract class Entry with _$Entry {
  const factory Entry.food(FoodRecord foodRecord) = FoodEntry;
  const factory Entry.water(WaterRecord waterRecord) = WaterEntry;

  const Entry._();

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);

  DateTime? get createdAt {
    return switch (this) {
      FoodEntry(foodRecord: final foodRecord) => foodRecord.createdAt,
      WaterEntry(waterRecord: final waterRecord) => waterRecord.createdAt,
      _ => null,
    };
  }

  String get displayName {
    return switch (this) {
      FoodEntry(foodRecord: final foodRecord) => foodRecord.name,
      WaterEntry(waterRecord: final waterRecord) => 'Water (${(waterRecord.amountInMl / 1000).toStringAsFixed(1)}L)',
      _ => '',
    };
  }

  String get type {
    return switch (this) {
      FoodEntry(foodRecord: final _) => 'Food',
      WaterEntry(waterRecord: final _) => 'Water',
      _ => '',
    };
  }
}
