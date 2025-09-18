import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/data/models/entry.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({super.key, required this.entry, required this.enabled, required this.onDismiss, required this.onTap});

  final Entry entry;
  final bool enabled;
  final VoidCallback onDismiss;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key(entry.id.toString()),
      direction: enabled ? DismissDirection.endToStart : DismissDirection.none,
      background: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      confirmDismiss: (direction) async {
        onDismiss();
        return false;
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: switch (entry) {
            WaterEntry() => Colors.blue,
            FoodEntry() => Colors.green,
            _ => Colors.grey,
          },
          child: Icon(switch (entry) {
            WaterEntry() => Icons.water_drop,
            FoodEntry() => Icons.restaurant,
            _ => Icons.question_mark,
          }, color: Colors.white),
        ),
        title: Text(entry.displayName),
        subtitle: Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(switch (entry) {
              WaterEntry() => 'Water',
              FoodEntry() => 'Food x ${(entry as FoodEntry).foodRecord.portionSize.toStringAsFixed(1)}',
              _ => 'Unknown',
            }),
            if (entry is FoodEntry) ...[
              const SizedBox(height: 12, child: VerticalDivider()),
              Text(
                '${(entry as FoodEntry).foodRecord.carbs.toInt()}g C',
                style: const TextStyle().copyWith(color: Colors.amber, fontWeight: FontWeight.bold),
              ),
              Text(
                '${(entry as FoodEntry).foodRecord.protein.toInt()}g P',
                style: const TextStyle().copyWith(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Text(
                '${(entry as FoodEntry).foodRecord.fat.toInt()}g F',
                style: const TextStyle().copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
        trailing: entry.createdAt != null ? Text(entry.formattedCreatedAt, style: theme.textTheme.bodySmall) : null,
        onTap: enabled ? onTap : null,
      ),
    );
  }
}
