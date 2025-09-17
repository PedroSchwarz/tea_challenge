import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';

class SecondaryProgressRing extends StatelessWidget {
  const SecondaryProgressRing({
    super.key,
    required this.progressPercentage,
    required this.totalLabel,
    required this.description,
    required this.color,
  });

  final double progressPercentage;
  final String totalLabel;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: CircularProgressIndicator(
            strokeWidth: 6,
            strokeCap: StrokeCap.round,
            backgroundColor: theme.colorScheme.surfaceContainer,
            color: color,
            value: progressPercentage,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(totalLabel, style: theme.textTheme.titleMedium?.copyWith(color: color)),
        Text(description, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
