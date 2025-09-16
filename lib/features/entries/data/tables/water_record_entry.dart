import 'package:drift/drift.dart';
import 'package:tea_challenge/app/database/base_table_mixin.dart';

class WaterRecordEntry extends Table with BaseTableMixin {
  RealColumn get amountInMl => real()();
}
