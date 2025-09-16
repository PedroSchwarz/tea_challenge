import 'package:drift/drift.dart';
import 'package:tea_challenge/app/database/base_table_mixin.dart';

class FoodRecordEntry extends Table with BaseTableMixin {
  TextColumn get name => text()();
  RealColumn get caloriesPerPortion => real()();
  RealColumn get portionSize => real()();
  RealColumn get carbs => real()();
  RealColumn get protein => real()();
  RealColumn get fat => real()();
}
