import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/ui/view_models/create_entry_view_model.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';

class WaterEntryForm extends StatelessWidget {
  const WaterEntryForm({super.key, required this.formKey, required this.waterController, required this.onSelectedQuantity});

  final GlobalKey<FormState> formKey;
  final TextEditingController waterController;
  final ValueChanged<String> onSelectedQuantity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: AppSpacing.sm,
        children: [
          Text('How many liters did you drink?', style: theme.textTheme.headlineSmall),
          Selector<CreateEntryViewModel, WaterQuantity>(
            selector: (context, viewModel) => viewModel.selectedQuantity,
            builder: (context, selectedQuantity, child) {
              return Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  ...WaterQuantity.values.map((quantity) {
                    return ChoiceChip(
                      label: Text(quantity.label),
                      selected: selectedQuantity == quantity,
                      onSelected: (selected) {
                        onSelectedQuantity(quantity.label);
                      },
                    );
                  }),
                ],
              );
            },
          ),
          Text('Custom amount', style: theme.textTheme.headlineSmall),
          Selector<CreateEntryViewModel, WaterQuantity>(
            selector: (context, viewModel) => viewModel.selectedQuantity,
            builder: (context, selectedQuantity, child) {
              return TextFormField(
                controller: waterController,
                enabled: selectedQuantity == WaterQuantity.custom,
                decoration: const InputDecoration(labelText: 'Water (L)'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Water is required';
                  }
                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
