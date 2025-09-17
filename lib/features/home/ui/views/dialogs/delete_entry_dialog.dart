import 'package:flutter/material.dart';

class DeleteEntryDialog extends StatelessWidget {
  const DeleteEntryDialog({super.key, required this.onDelete, required this.onCancel});

  final void Function() onDelete;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Entry"),
      content: const Text('Are you sure you want to delete this entry?'),
      actions: [TextButton(onPressed: onDelete, child: const Text("Delete")), TextButton(onPressed: onCancel, child: const Text("Cancel"))],
    );
  }
}
