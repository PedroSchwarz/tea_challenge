import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:tea_challenge/features/entries/entries.dart';

part 'app_database.g.dart';

typedef FoodRecordManager = $$FoodRecordEntryTableTableManager;
typedef WaterRecordManager = $$WaterRecordEntryTableTableManager;

@DriftDatabase(tables: [FoodRecordEntry, WaterRecordEntry])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'tea_challenge_app_database',
      native: const DriftNativeOptions(databaseDirectory: path_provider.getApplicationSupportDirectory),
    );
  }
}
