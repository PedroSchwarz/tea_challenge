import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:tea_challenge/app/database/app_database.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';

abstract class FoodLocalDataSource {
  Future<void> insertFoodRecord(FoodRecord record);
  Future<List<FoodRecord>> getFoodRecords({DateTime? date});
  Future<FoodRecord?> getFoodRecord(int id);
  Future<void> updateFoodRecord(FoodRecord record);
  Future<void> deleteFoodRecord(int id);
}

class FoodLocalDataSourceImpl implements FoodLocalDataSource {
  FoodLocalDataSourceImpl({required this.manager});

  @visibleForTesting
  final FoodRecordManager manager;

  @override
  Future<void> insertFoodRecord(FoodRecord record) async {
    await manager.create(
      (o) => o(
        name: record.name,
        caloriesPerPortion: record.caloriesPerPortion,
        portionSize: record.portionSize,
        carbs: record.carbs,
        protein: record.protein,
        fat: record.fat,
      ),
    );
  }

  @override
  Future<void> deleteFoodRecord(int id) async {
    await manager.filter((filter) => filter.id(id)).delete();
  }

  @override
  Future<FoodRecord?> getFoodRecord(int id) async {
    final record = await manager.filter((filter) => filter.id(id)).getSingle();
    return FoodRecord(
      name: record.name,
      caloriesPerPortion: record.caloriesPerPortion,
      portionSize: record.portionSize,
      carbs: record.carbs,
      protein: record.protein,
      fat: record.fat,
      id: record.id,
      createdAt: record.createdAt,
    );
  }

  @override
  Future<List<FoodRecord>> getFoodRecords({DateTime? date}) async {
    if (date != null) {
      // Get start and end of the day
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

      final records = await manager.filter((filter) => filter.createdAt.isBetween(startOfDay, endOfDay)).get();
      return records.map((record) {
        return FoodRecord(
          name: record.name,
          caloriesPerPortion: record.caloriesPerPortion,
          portionSize: record.portionSize,
          carbs: record.carbs,
          protein: record.protein,
          fat: record.fat,
          id: record.id,
          createdAt: record.createdAt,
        );
      }).toList();
    } else {
      final records = await manager.get();
      return records.map((record) {
        return FoodRecord(
          name: record.name,
          caloriesPerPortion: record.caloriesPerPortion,
          portionSize: record.portionSize,
          carbs: record.carbs,
          protein: record.protein,
          fat: record.fat,
          id: record.id,
          createdAt: record.createdAt,
        );
      }).toList();
    }
  }

  @override
  Future<void> updateFoodRecord(FoodRecord record) async {
    await manager
        .filter((filter) => filter.id(record.id))
        .update(
          (o) => o(
            name: Value(record.name),
            caloriesPerPortion: Value(record.caloriesPerPortion),
            portionSize: Value(record.portionSize),
            carbs: Value(record.carbs),
            protein: Value(record.protein),
            fat: Value(record.fat),
          ),
        );
  }
}
