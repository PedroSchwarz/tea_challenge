import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';

class EmptyEntriesContent extends StatelessWidget {
  const EmptyEntriesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notes, size: 64, color: Colors.grey),
          SizedBox(height: AppSpacing.md),
          Text('No water/food entries found', style: TextStyle(fontSize: 18, color: Colors.grey)),
          SizedBox(height: AppSpacing.sm),
          Text('Start tracking your water/food intake!', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
