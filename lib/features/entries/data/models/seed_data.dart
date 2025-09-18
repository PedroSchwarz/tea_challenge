import 'package:tea_challenge/features/entries/data/models/food_record.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';

class SeedData {
  final List<FoodRecord> foodRecords;
  final List<WaterRecord> waterRecords;

  const SeedData({required this.foodRecords, required this.waterRecords});

  factory SeedData.fromJson(Map<String, dynamic> json) {
    return SeedData(
      foodRecords: (json['foodRecords'] as List).map((item) => FoodRecord.fromJson(item as Map<String, dynamic>)).toList(),
      waterRecords: (json['waterRecords'] as List).map((item) => WaterRecord.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodRecords': foodRecords.map((record) => record.toJson()).toList(),
      'waterRecords': waterRecords.map((record) => record.toJson()).toList(),
    };
  }
}
