import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_data.g.dart';
part 'history_data.freezed.dart';

@freezed
abstract class HistoryData with _$HistoryData {
  const factory HistoryData({required DateTime date, required double caloriesProgress, required double waterProgress}) = _HistoryData;

  factory HistoryData.fromJson(Map<String, dynamic> json) => _$HistoryDataFromJson(json);
}
