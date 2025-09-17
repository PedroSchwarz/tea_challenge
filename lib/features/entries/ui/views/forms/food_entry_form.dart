import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/domain/usecases/validate_numeric_field.dart';
import 'package:tea_challenge/features/entries/ui/view_models/create_entry_view_model.dart';

class FoodEntryForm extends StatelessWidget {
  const FoodEntryForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.caloriesPerPortionController,
    required this.portionSizeController,
    required this.carbsController,
    required this.proteinController,
    required this.fatController,
    required this.validateNumericField,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController caloriesPerPortionController;
  final TextEditingController portionSizeController;
  final TextEditingController carbsController;
  final TextEditingController proteinController;
  final TextEditingController fatController;
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
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          Row(
            spacing: AppSpacing.sm,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: TextFormField(
                  controller: caloriesPerPortionController,
                  decoration: const InputDecoration(labelText: 'Calories per portion'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    final result = validateNumericField(value);
                    switch (result) {
                      case NumericValidationResult.valid:
                        return null;
                      case NumericValidationResult.empty:
                        return 'Calories per portion is required';
                      case NumericValidationResult.invalidFormat:
                        return 'Calories per portion must be a valid number (e.g., 123 or 123.45)';
                      case NumericValidationResult.tooManyDecimals:
                        return 'Calories per portion can have at most 2 decimal places';
                      case NumericValidationResult.containsLetters:
                        return 'Calories per portion must contain only numbers';
                      case NumericValidationResult.containsSpecialChars:
                        return 'Calories per portion must contain only numbers and decimal point';
                    }
                  },
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: portionSizeController,
                  decoration: const InputDecoration(labelText: 'Portion size'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    final result = validateNumericField(value);
                    switch (result) {
                      case NumericValidationResult.valid:
                        return null;
                      case NumericValidationResult.empty:
                        return 'Portion size is required';
                      case NumericValidationResult.invalidFormat:
                        return 'Portion size must be a valid number (e.g., 123 or 123.45)';
                      case NumericValidationResult.tooManyDecimals:
                        return 'Portion size can have at most 2 decimal places';
                      case NumericValidationResult.containsLetters:
                        return 'Portion size must contain only numbers';
                      case NumericValidationResult.containsSpecialChars:
                        return 'Portion size must contain only numbers and decimal point';
                    }
                  },
                ),
              ),
            ],
          ),
          TextFormField(
            controller: carbsController,
            decoration: const InputDecoration(labelText: 'Carbs'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              final result = validateNumericField(value);
              switch (result) {
                case NumericValidationResult.valid:
                  return null;
                case NumericValidationResult.empty:
                  return 'Carbs is required';
                case NumericValidationResult.invalidFormat:
                  return 'Carbs must be a valid number (e.g., 123 or 123.45)';
                case NumericValidationResult.tooManyDecimals:
                  return 'Carbs can have at most 2 decimal places';
                case NumericValidationResult.containsLetters:
                  return 'Carbs must contain only numbers';
                case NumericValidationResult.containsSpecialChars:
                  return 'Carbs must contain only numbers and decimal point';
              }
            },
          ),
          TextFormField(
            controller: proteinController,
            decoration: const InputDecoration(labelText: 'Protein'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              final result = validateNumericField(value);
              switch (result) {
                case NumericValidationResult.valid:
                  return null;
                case NumericValidationResult.empty:
                  return 'Protein is required';
                case NumericValidationResult.invalidFormat:
                  return 'Protein must be a valid number (e.g., 123 or 123.45)';
                case NumericValidationResult.tooManyDecimals:
                  return 'Protein can have at most 2 decimal places';
                case NumericValidationResult.containsLetters:
                  return 'Protein must contain only numbers';
                case NumericValidationResult.containsSpecialChars:
                  return 'Protein must contain only numbers and decimal point';
              }
            },
          ),
          TextFormField(
            controller: fatController,
            decoration: const InputDecoration(labelText: 'Fat'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              final result = validateNumericField(value);
              switch (result) {
                case NumericValidationResult.valid:
                  return null;
                case NumericValidationResult.empty:
                  return 'Fat is required';
                case NumericValidationResult.invalidFormat:
                  return 'Fat must be a valid number (e.g., 123 or 123.45)';
                case NumericValidationResult.tooManyDecimals:
                  return 'Fat can have at most 2 decimal places';
                case NumericValidationResult.containsLetters:
                  return 'Fat must contain only numbers';
                case NumericValidationResult.containsSpecialChars:
                  return 'Fat must contain only numbers and decimal point';
              }
            },
          ),
          Selector<CreateEntryViewModel, double>(
            selector: (context, viewModel) => viewModel.totalCalories,
            builder: (context, totalCalories, child) {
              return Row(
                spacing: AppSpacing.sm,
                children: [
                  Text('Total Calories: $totalCalories Kcal', style: theme.textTheme.headlineSmall),
                  Tooltip(
                    margin: const EdgeInsets.all(AppSpacing.sm),
                    message: 'Total calories is calculated by multiplying the calories per portion by the portion size',
                    child: Icon(Icons.info_outline, size: 24, color: theme.colorScheme.primary),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ).animate().fadeIn();
  }
}
