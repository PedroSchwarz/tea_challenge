import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/app/theming/design_system/app_skeleton.dart';
import 'package:tea_challenge/features/history/data/models/history_data.dart';
import 'package:tea_challenge/features/history/ui/components/progression_card.dart';

class ProgressionHistorySection extends StatelessWidget {
  const ProgressionHistorySection({super.key, required this.historyData, required this.isLoading, required this.onTap});

  final List<HistoryData> historyData;
  final bool isLoading;
  final void Function(HistoryData dayData) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: AppSpacing.sm,
            children: [
              Text('Progress History', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const Tooltip(message: 'Click a card to see the details.', child: Icon(Icons.info_outline, size: 24)),
            ],
          ),
          const Gap(AppSpacing.md),
          if (isLoading)
            const AppSkeleton(isLoading: true, child: SizedBox(height: 180, width: double.infinity))
          else
            Row(
              spacing: AppSpacing.md,
              children:
                  historyData.map((dayData) {
                    return Expanded(child: ProgressionCard(dayData: dayData, onTap: () => onTap(dayData)));
                  }).toList(),
            ),
        ],
      ),
    );
  }
}
