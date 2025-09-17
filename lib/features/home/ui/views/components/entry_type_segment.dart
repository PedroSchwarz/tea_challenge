import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_filter_type.dart';

class EntryTypeSegment extends StatelessWidget {
  const EntryTypeSegment({super.key, required this.selectedSegment, required this.onSelected});

  final HomeFilterType selectedSegment;
  final ValueChanged<HomeFilterType> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: SegmentedButton<HomeFilterType>(
        segments: const [
          ButtonSegment(value: HomeFilterType.all, label: Text('All')),
          ButtonSegment(value: HomeFilterType.food, label: Text('Food')),
          ButtonSegment(value: HomeFilterType.water, label: Text('Water')),
        ],
        selected: {selectedSegment},
        onSelectionChanged: (value) {
          onSelected(value.first);
        },
      ),
    );
  }
}
