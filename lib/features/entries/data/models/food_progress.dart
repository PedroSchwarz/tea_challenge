import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_progress.g.dart';
part 'food_progress.freezed.dart';

@freezed
abstract class FoodProgress with _$FoodProgress {
  const factory FoodProgress({
    required double totalCalories,
    required double totalCarbs,
    required double totalProtein,
    required double totalFat,
    required double caloriesGoal,
    required double carbsGoal,
    required double proteinGoal,
    required double fatGoal,
  }) = _FoodProgress;

  const FoodProgress._();

  factory FoodProgress.fromJson(Map<String, dynamic> json) => _$FoodProgressFromJson(json);

  double get caloriesProgressPercentage {
    if (caloriesGoal <= 0) return 0.0;
    return (totalCalories / caloriesGoal).clamp(0.0, 1.0);
  }

  double get carbsProgressPercentage {
    if (carbsGoal <= 0) return 0.0;
    return (totalCarbs / carbsGoal).clamp(0.0, 1.0);
  }

  double get proteinProgressPercentage {
    if (proteinGoal <= 0) return 0.0;
    return (totalProtein / proteinGoal).clamp(0.0, 1.0);
  }

  double get fatProgressPercentage {
    if (fatGoal <= 0) return 0.0;
    return (totalFat / fatGoal).clamp(0.0, 1.0);
  }

  double get remainingCalories => (caloriesGoal - totalCalories).clamp(0.0, double.infinity);
  double get remainingCarbs => (carbsGoal - totalCarbs).clamp(0.0, double.infinity);
  double get remainingProtein => (proteinGoal - totalProtein).clamp(0.0, double.infinity);
  double get remainingFat => (fatGoal - totalFat).clamp(0.0, double.infinity);

  bool get isCaloriesGoalReached => totalCalories >= caloriesGoal;
  bool get isCarbsGoalReached => totalCarbs >= carbsGoal;
  bool get isProteinGoalReached => totalProtein >= proteinGoal;
  bool get isFatGoalReached => totalFat >= fatGoal;

  bool get areAllGoalsReached => isCaloriesGoalReached && isCarbsGoalReached && isProteinGoalReached && isFatGoalReached;
}
