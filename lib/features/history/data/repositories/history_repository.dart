import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/repositories/food_record_repository.dart';
import 'package:tea_challenge/features/entries/data/repositories/water_record_repository.dart';
import 'package:tea_challenge/features/history/data/models/history_data.dart';

class HistoryRepository {
  HistoryRepository({required this.foodRecordRepository, required this.waterRecordRepository});

  @visibleForTesting
  final FoodRecordRepository foodRecordRepository;

  @visibleForTesting
  final WaterRecordRepository waterRecordRepository;

  final Logger _logger = Logger('HistoryRepository');

  /// Fetches historical data for the last N days
  ///
  /// Returns a list of HistoryDayData sorted by date (most recent first)
  Future<List<HistoryData>> getHistoryData({required double caloriesGoal, required double waterGoal, int days = 3}) async {
    try {
      final now = DateTime.now();
      final historyData = <HistoryData>[];

      // Load data for the specified number of days
      for (int i = 0; i < days; i++) {
        final date = now.subtract(Duration(days: i));

        // Load food records for this date
        final foodRecords = await foodRecordRepository.getFoodRecords(date: date);
        final totalCalories = foodRecords.fold(0.0, (sum, record) => sum + (record.caloriesPerPortion * record.portionSize));

        // Load water records for this date
        final waterRecords = await waterRecordRepository.getWaterRecords(date: date);
        final totalWaterMl = waterRecords.fold(0.0, (sum, record) => sum + record.amountInMl);

        // Calculate progress percentages
        final caloriesProgress = caloriesGoal > 0 ? (totalCalories / caloriesGoal).clamp(0.0, 1.0) : 0.0;
        final waterProgressPercentage = waterGoal > 0 ? (totalWaterMl / 1000 / waterGoal).clamp(0.0, 1.0) : 0.0;

        historyData.add(HistoryData(date: date, caloriesProgress: caloriesProgress, waterProgress: waterProgressPercentage));
      }

      return historyData;
    } catch (e, s) {
      _logger.severe('Error loading history data', e, s);
      rethrow;
    }
  }
}
