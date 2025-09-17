import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';

class MainProgressRing extends StatelessWidget {
  const MainProgressRing({
    super.key,
    required this.progressPercentage,
    required this.topLabel,
    required this.middleLabel,
    required this.bottomLabel,
    required this.color,
    this.size,
  });

  final double progressPercentage;
  final String topLabel;
  final String middleLabel;
  final String bottomLabel;
  final Color color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: size ?? 150,
          width: size ?? 150,
          child: CircularProgressIndicator(
            strokeWidth: 12,
            strokeCap: StrokeCap.round,
            backgroundColor: theme.colorScheme.surfaceContainer,
            color: color,
            value: progressPercentage,
          ),
        ),
        Column(
          children: [
            Text(topLabel, style: theme.textTheme.headlineLarge?.copyWith(color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: AppSpacing.xs),
            Text(middleLabel, style: theme.textTheme.bodyLarge),
            const SizedBox(height: AppSpacing.sm),
            Text(bottomLabel, style: theme.textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
