import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_record.g.dart';
part 'water_record.freezed.dart';

@freezed
abstract class WaterRecord with _$WaterRecord {
  const factory WaterRecord({required double amountInMl, int? id, DateTime? createdAt}) = _WaterRecord;

  factory WaterRecord.fromJson(Map<String, dynamic> json) => _$WaterRecordFromJson(json);
}
