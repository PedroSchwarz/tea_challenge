import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/data_sources/seed_data.dart';

abstract class EntriesSeedRemoteDataSource {
  Future<SeedData> getSeedData();
}

class EntriesSeedRemoteDataSourceImpl implements EntriesSeedRemoteDataSource {
  EntriesSeedRemoteDataSourceImpl();

  final Logger _logger = Logger('EntriesSeedRemoteDataSource');

  @override
  Future<SeedData> getSeedData() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      // Load JSON from assets
      final jsonString = await _loadJsonFromAssets();
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      return SeedData.fromJson(jsonData);
    } catch (e, s) {
      _logger.severe('Error loading seed data from remote source', e, s);
      rethrow;
    }
  }

  Future<String> _loadJsonFromAssets() async {
    try {
      // In a real app, this would be a network request
      // For now, we'll load from the local JSON file
      final String jsonString = await rootBundle.loadString('assets/seed/entries_seed_data.json');
      return jsonString;
    } catch (e) {
      _logger.severe('Error reading seed data file', e);
      rethrow;
    }
  }
}
