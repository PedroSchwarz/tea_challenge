import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/data/models/entry.dart';

class EntryItem extends StatelessWidget {
  const EntryItem({super.key, required this.entry, required this.onDismiss, required this.onTap});

  final Entry entry;
  final VoidCallback onDismiss;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key(entry.id.toString()),
      direction: DismissDirection.endToStart,
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
        subtitle: Text(switch (entry) {
          WaterEntry() => 'Water',
          FoodEntry() => 'Food',
          _ => 'Unknown',
        }),
        trailing: entry.createdAt != null ? Text(entry.formattedCreatedAt, style: theme.textTheme.bodySmall) : null,
        onTap: onTap,
      ),
    );
  }
}
