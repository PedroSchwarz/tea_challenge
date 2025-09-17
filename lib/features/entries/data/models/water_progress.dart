import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_progress.g.dart';
part 'water_progress.freezed.dart';

@freezed
abstract class WaterProgress with _$WaterProgress {
  const factory WaterProgress({required double totalAmountInMl, required double goalInLiters}) = _WaterProgress;

  const WaterProgress._();

  factory WaterProgress.fromJson(Map<String, dynamic> json) => _$WaterProgressFromJson(json);

  double get totalAmountInLiters => totalAmountInMl / 1000;

  double get progressPercentage {
    if (goalInLiters <= 0) return 0.0;
    return (totalAmountInLiters / goalInLiters).clamp(0.0, 1.0);
  }

  double get remainingInLiters => (goalInLiters - totalAmountInLiters).clamp(0.0, double.infinity);

  bool get isGoalReached => totalAmountInLiters >= goalInLiters;
}
