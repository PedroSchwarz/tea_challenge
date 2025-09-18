import 'package:flutter/material.dart';
import 'package:tea_challenge/features/entries/data/models/entry.dart';
import 'package:tea_challenge/features/entries/ui/views/components/entry_item.dart';

class EntriesListContent extends StatelessWidget {
  const EntriesListContent({super.key, required this.entries, required this.enabled, required this.onDismiss, required this.onTap});

  final List<Entry> entries;
  final bool enabled;
  final void Function(Entry entry) onDismiss;
  final Future<void> Function(Entry entry) onTap;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final entry = entries[index];

        return EntryItem(
          key: ValueKey(entry.id),
          entry: entry,
          enabled: enabled,
          onDismiss: () {
            onDismiss(entry);
          },
          onTap: () async {
            await onTap(entry);
          },
        );
      },
    );
  }
}
