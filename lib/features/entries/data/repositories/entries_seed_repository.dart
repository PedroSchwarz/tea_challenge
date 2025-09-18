import 'package:flutter/material.dart';
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

      // Insert 3 days of seed data
      for (int i = 0; i < 3; i++) {
        // Get the date for the current day
        final date = DateUtils.dateOnly(DateTime.now().subtract(Duration(days: i)));

        // Map the seed data to the current day
        final foodRecords = seedData.foodRecords.map((record) => record.copyWith(createdAt: date)).toList();
        final waterRecords = seedData.waterRecords.map((record) => record.copyWith(createdAt: date)).toList();

        // Insert the seed data for the current day
        await foodRecordRepository.insertFoodRecords(foodRecords);
        await waterRecordRepository.insertWaterRecords(waterRecords);
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
