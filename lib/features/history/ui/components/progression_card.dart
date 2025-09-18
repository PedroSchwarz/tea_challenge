import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/history/data/models/history_data.dart';

class ProgressionCard extends StatelessWidget {
  const ProgressionCard({super.key, required this.dayData, required this.isSelected, required this.onTap});

  final HistoryData dayData;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      borderRadius: BorderRadius.circular(AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(AppSpacing.sm),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.sm),
            border: Border.all(color: isSelected ? theme.colorScheme.primary : theme.colorScheme.primaryContainer, width: 1),
          ),
          child: Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.md,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            children: [
              // Date label
              Text(
                '${dayData.date.day}/${dayData.date.month}',
                style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7), fontWeight: FontWeight.w500),
              ),
              const Gap(AppSpacing.sm),
              _ProgressOverview(progress: dayData.caloriesProgress, label: 'Cal', color: Colors.orange),
              _ProgressOverview(progress: dayData.waterProgress, label: 'Water', color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressOverview extends StatelessWidget {
  const _ProgressOverview({required this.progress, required this.label, required this.color});

  final double progress;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.bodyLarge?.copyWith(color: color, fontWeight: FontWeight.w600)),
        const Gap(AppSpacing.sm),
        Row(
          spacing: AppSpacing.sm,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.sm),
                child: LinearProgressIndicator(
                  minHeight: 10,
                  backgroundColor: theme.colorScheme.outline.withValues(alpha: 0.2),
                  color: color,
                  value: progress,
                ),
              ),
            ),
            Text('${(progress * 100).round()}%', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
