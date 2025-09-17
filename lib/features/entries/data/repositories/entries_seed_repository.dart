import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/data_sources/entries_seed_local_data_source.dart';
import 'package:tea_challenge/features/entries/data/data_sources/entries_seed_remote_data_source.dart';
import 'package:tea_challenge/features/entries/data/repositories/food_record_repository.dart';
import 'package:tea_challenge/features/entries/data/repositories/water_record_repository.dart';

class EntriesSeedRepository {
  EntriesSeedRepository({
    required this.entriesSeedRemoteDataSource,
    required this.foodRecordRepository,
    required this.waterRecordRepository,
    required this.entriesSeedLocalDataSource,
  });

  @visibleForTesting
  final EntriesSeedRemoteDataSource entriesSeedRemoteDataSource;

  @visibleForTesting
  final FoodRecordRepository foodRecordRepository;

  @visibleForTesting
  final WaterRecordRepository waterRecordRepository;

  @visibleForTesting
  final EntriesSeedLocalDataSource entriesSeedLocalDataSource;

  final _logger = Logger('EntriesSeedRepository');

  /// Checks if seed data has already been initialized
  Future<bool> get isSeedDataInitialized => entriesSeedLocalDataSource.isInitialized();

  /// Initializes the app with seed data if it hasn't been done before
  Future<void> initializeSeedDataIfNeeded() async {
    if (await isSeedDataInitialized) {
      _logger.info('Seed data already initialized, skipping');
      return;
    }

    try {
      _logger.info('Initializing seed data...');

      // Get seed data from remote source
      final seedData = await entriesSeedRemoteDataSource.getSeedData();

      // Insert food records
      for (final foodRecord in seedData.foodRecords) {
        await foodRecordRepository.insertFoodRecord(foodRecord);
      }

      // Insert water records
      for (final waterRecord in seedData.waterRecords) {
        await waterRecordRepository.insertWaterRecord(waterRecord);
      }

      // Mark as initialized
      await entriesSeedLocalDataSource.markInitialized();

      _logger.info(
        'Seed data initialized successfully with ${seedData.foodRecords.length} food records and ${seedData.waterRecords.length} water records',
      );
    } catch (e, s) {
      _logger.severe('Error initializing seed data', e, s);
      rethrow;
    }
  }

  Future<void> resetSeedDataFlag() async {
    try {
      await entriesSeedLocalDataSource.reset();
    } catch (e, s) {
      _logger.severe('Error resetting seed data', e, s);
    }
  }
}
