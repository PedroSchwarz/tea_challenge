import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:tea_challenge/app/database/app_database.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';

abstract class WaterLocalDataSource {
  Future<void> insertWaterRecord(WaterRecord record);
  Future<List<WaterRecord>> getWaterRecords();
  Future<WaterRecord?> getWaterRecord(int id);
  Future<void> updateWaterRecord(WaterRecord record);
  Future<void> deleteWaterRecord(int id);
}

class WaterLocalDataSourceImpl implements WaterLocalDataSource {
  WaterLocalDataSourceImpl({required this.manager});

  @visibleForTesting
  final WaterRecordManager manager;

  @override
  Future<void> insertWaterRecord(WaterRecord record) async {
    await manager.create((o) => o(amountInMl: record.amountInMl));
  }

  @override
  Future<void> deleteWaterRecord(int id) async {
    await manager.filter((filter) => filter.id(id)).delete();
  }

  @override
  Future<WaterRecord?> getWaterRecord(int id) async {
    final record = await manager.filter((filter) => filter.id(id)).getSingle();
    return WaterRecord.fromJson(record.toJson());
  }

  @override
  Future<List<WaterRecord>> getWaterRecords() async {
    final records = await manager.get();
    return records.map((record) => WaterRecord.fromJson(record.toJson())).toList();
  }

  @override
  Future<void> updateWaterRecord(WaterRecord record) async {
    await manager.filter((filter) => filter.id(record.id)).update((o) => o(amountInMl: Value(record.amountInMl)));
  }
}
