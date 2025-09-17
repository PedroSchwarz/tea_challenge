import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
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
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController caloriesPerPortionController;
  final TextEditingController portionSizeController;
  final TextEditingController carbsController;
  final TextEditingController proteinController;
  final TextEditingController fatController;

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
            children: [
              Flexible(
                child: TextFormField(
                  controller: caloriesPerPortionController,
                  decoration: const InputDecoration(labelText: 'Calories per portion'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Calories per portion is required';
                    }
                    return null;
                  },
                ),
              ),
              Flexible(
                child: TextFormField(
                  controller: portionSizeController,
                  decoration: const InputDecoration(labelText: 'Portion size'),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Portion size is required';
                    }
                    return null;
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
              if (value == null || value.isEmpty) {
                return 'Carbs is required';
              }
              return null;
            },
          ),
          TextFormField(
            controller: proteinController,
            decoration: const InputDecoration(labelText: 'Protein'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Protein is required';
              }
              return null;
            },
          ),
          TextFormField(
            controller: fatController,
            decoration: const InputDecoration(labelText: 'Fat'),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Fat is required';
              }
              return null;
            },
          ),
          const Gap(AppSpacing.md),
          Selector<CreateEntryViewModel, double>(
            selector: (context, viewModel) => viewModel.totalCalories,
            builder: (context, totalCalories, child) {
              return Text('Total Calories: $totalCalories', style: theme.textTheme.headlineSmall);
            },
          ),
        ],
      ),
    );
  }
}
