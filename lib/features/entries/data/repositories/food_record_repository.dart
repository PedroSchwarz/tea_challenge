import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/data_sources/food_local_data_source.dart';
import 'package:tea_challenge/features/entries/data/models/food_progress.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';

class FoodRecordRepository {
  FoodRecordRepository({required this.foodLocalDataSource});

  @visibleForTesting
  final FoodLocalDataSource foodLocalDataSource;

  final Logger _logger = Logger('FoodRecordRepository');

  Future<FoodProgress> getTotalCaloriesForToday() async {
    try {
      final foodRecords = await foodLocalDataSource.getFoodRecords();
      final totalCalories = foodRecords.fold(0.0, (sum, record) => sum + record.caloriesPerPortion);
      final totalCarbs = foodRecords.fold(0.0, (sum, record) => sum + record.carbs);
      final totalProtein = foodRecords.fold(0.0, (sum, record) => sum + record.protein);
      final totalFat = foodRecords.fold(0.0, (sum, record) => sum + record.fat);
      return FoodProgress(calories: totalCalories, carbs: totalCarbs, protein: totalProtein, fat: totalFat);
    } catch (e, s) {
      _logger.severe('Error getting total calories for today', e, s);
      rethrow;
    }
  }

  Future<void> insertFoodRecord(FoodRecord record) async {
    try {
      await foodLocalDataSource.insertFoodRecord(record);
    } catch (e, s) {
      _logger.severe('Error inserting food record', e, s);
      rethrow;
    }
  }

  Future<void> updateFoodRecord(FoodRecord record) async {
    try {
      await foodLocalDataSource.updateFoodRecord(record);
    } catch (e, s) {
      _logger.severe('Error updating food record', e, s);
      rethrow;
    }
  }

  Future<void> deleteFoodRecord(int id) async {
    try {
      await foodLocalDataSource.deleteFoodRecord(id);
    } catch (e, s) {
      _logger.severe('Error deleting food record', e, s);
      rethrow;
    }
  }

  Future<FoodRecord?> getFoodRecord(int id) async {
    try {
      return await foodLocalDataSource.getFoodRecord(id);
    } catch (e, s) {
      _logger.severe('Error getting food record', e, s);
      rethrow;
    }
  }

  Future<List<FoodRecord>> getFoodRecords() async {
    try {
      return await foodLocalDataSource.getFoodRecords();
    } catch (e, s) {
      _logger.severe('Error getting food records', e, s);
      rethrow;
    }
  }
}
