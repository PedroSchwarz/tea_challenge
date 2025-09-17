import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/data_sources/water_local_data_source.dart';
import 'package:tea_challenge/features/entries/data/models/water_progress.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';

class WaterRecordRepository {
  WaterRecordRepository({required this.waterLocalDataSource});

  @visibleForTesting
  final WaterLocalDataSource waterLocalDataSource;

  final Logger _logger = Logger('WaterRecordRepository');

  Future<void> insertWaterRecord(WaterRecord record) async {
    try {
      await waterLocalDataSource.insertWaterRecord(record);
    } catch (e, s) {
      _logger.severe('Error inserting water record', e, s);
      rethrow;
    }
  }

  Future<void> updateWaterRecord(WaterRecord record) async {
    try {
      await waterLocalDataSource.updateWaterRecord(record);
    } catch (e, s) {
      _logger.severe('Error updating water record', e, s);
      rethrow;
    }
  }

  Future<void> deleteWaterRecord(int id) async {
    try {
      await waterLocalDataSource.deleteWaterRecord(id);
    } catch (e, s) {
      _logger.severe('Error deleting water record', e, s);
      rethrow;
    }
  }

  Future<WaterRecord?> getWaterRecord(int id) async {
    try {
      return await waterLocalDataSource.getWaterRecord(id);
    } catch (e, s) {
      _logger.severe('Error getting water record', e, s);
      rethrow;
    }
  }

  Future<List<WaterRecord>> getWaterRecords({DateTime? date}) async {
    try {
      return await waterLocalDataSource.getWaterRecords(date: date);
    } catch (e, s) {
      _logger.severe('Error getting water records', e, s);
      rethrow;
    }
  }

  Future<WaterProgress> getWaterProgressForDate({required DateTime date, required double goalInLiters}) async {
    try {
      final waterRecords = await getWaterRecords(date: date);
      final totalAmountInMl = waterRecords.fold(0.0, (sum, record) => sum + record.amountInMl);

      return WaterProgress(totalAmountInMl: totalAmountInMl, goalInLiters: goalInLiters);
    } catch (e, s) {
      _logger.severe('Error getting water progress for date', e, s);
      rethrow;
    }
  }
}
