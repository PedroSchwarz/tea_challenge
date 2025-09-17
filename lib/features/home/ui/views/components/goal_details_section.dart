import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/data/models/food_progress.dart';
import 'package:tea_challenge/features/entries/data/models/water_progress.dart';
import 'package:tea_challenge/features/home/ui/views/components/secondary_progress_ring.dart';

class GoalDetailsSection extends StatelessWidget {
  const GoalDetailsSection({super.key, required this.foodProgress, required this.waterProgress});

  final FoodProgress foodProgress;
  final WaterProgress waterProgress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      spacing: AppSpacing.lg,
      runSpacing: AppSpacing.md,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        // Carbs
        SecondaryProgressRing(
          progressPercentage: foodProgress.carbsProgressPercentage,
          totalLabel: '${foodProgress.totalCarbs.toInt()}g',
          goalLabel: '${foodProgress.carbsGoal.toInt()}g',
          description: 'Carbs',
          color: Colors.amber,
        ),
        // Protein
        SecondaryProgressRing(
          progressPercentage: foodProgress.proteinProgressPercentage,
          totalLabel: '${foodProgress.totalProtein.toInt()}g',
          goalLabel: '${foodProgress.proteinGoal.toInt()}g',
          description: 'Protein',
          color: Colors.green,
        ),
        // Fat
        SecondaryProgressRing(
          progressPercentage: foodProgress.fatProgressPercentage,
          totalLabel: '${foodProgress.totalFat.toInt()}g',
          goalLabel: '${foodProgress.fatGoal.toInt()}g',
          description: 'Fat',
          color: Colors.red,
        ),
        const Gap(AppSpacing.xxxl),
        // Water Progress Details
        Column(
          spacing: AppSpacing.md,
          children: [
            Column(
              children: [
                Text('${waterProgress.remainingInLiters.toStringAsFixed(1)}L', style: theme.textTheme.titleLarge?.copyWith(color: Colors.orange)),
                Text('Remaining', style: theme.textTheme.bodyMedium),
              ],
            ),
            Column(
              children: [
                Icon(
                  waterProgress.isGoalReached ? Icons.check_circle : Icons.water_drop,
                  color: waterProgress.isGoalReached ? Colors.green : Colors.blue,
                  size: 32,
                ),
                Text(
                  waterProgress.isGoalReached ? 'Goal Reached!' : 'Keep Going',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: waterProgress.isGoalReached ? Colors.green : Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
