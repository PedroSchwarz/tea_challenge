import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/domain/usecases/validate_numeric_field.dart';
import 'package:tea_challenge/features/entries/ui/view_models/create_entry_view_model.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';

class WaterEntryForm extends StatelessWidget {
  const WaterEntryForm({
    super.key,
    required this.formKey,
    required this.waterController,
    required this.onSelectedQuantity,
    required this.validateNumericField,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController waterController;
  final ValueChanged<String> onSelectedQuantity;
  final ValidateNumericField validateNumericField;

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
                  final result = validateNumericField(value);
                  switch (result) {
                    case NumericValidationResult.valid:
                      return null;
                    case NumericValidationResult.empty:
                      return 'Water is required';
                    case NumericValidationResult.invalidFormat:
                      return 'Water must be a valid number (e.g., 123 or 123.45)';
                    case NumericValidationResult.tooManyDecimals:
                      return 'Water can have at most 2 decimal places';
                    case NumericValidationResult.containsLetters:
                      return 'Water must contain only numbers';
                    case NumericValidationResult.containsSpecialChars:
                      return 'Water must contain only numbers and decimal point';
                  }
                },
              );
            },
          ),
        ],
      ),
    ).animate().fadeIn();
  }
}
