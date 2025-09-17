import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/dependencies/locator.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';
import 'package:tea_challenge/features/entries/ui/view_models/create_entry_view_model.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';
import 'package:tea_challenge/features/entries/ui/views/forms/food_entry_form.dart';
import 'package:tea_challenge/features/entries/ui/views/forms/water_entry_form.dart';

class CreateEntryScreen extends StatefulWidget {
  const CreateEntryScreen({super.key, this.id, this.type});
  final int? id;
  final EntryType? type;

  static const String routeName = 'create_retry';

  @override
  CreateEntryScreenState createState() => CreateEntryScreenState();
}

class CreateEntryScreenState extends State<CreateEntryScreen> {
  final CreateEntryViewModel _viewModel = getIt<CreateEntryViewModel>();

  final _foodFormKey = GlobalKey<FormState>();
  final _waterFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _caloriesPerPortionController = TextEditingController();
  final _portionSizeController = TextEditingController();
  final _carbsController = TextEditingController();
  final _proteinController = TextEditingController();
  final _fatController = TextEditingController();
  final _waterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.id != null && widget.type != null) {
      _viewModel.load(id: widget.id!, type: widget.type!);
    }
    _setupControllers();
    _initializeControllers();
    _initializeWaterController();
  }

  void _setupControllers() {
    _nameController.addListener(() => _viewModel.setName(_nameController.text));
    _caloriesPerPortionController.addListener(() => _viewModel.setCaloriesPerPortion(_caloriesPerPortionController.text));
    _portionSizeController.addListener(() => _viewModel.setPortionSize(_portionSizeController.text));
    _carbsController.addListener(() => _viewModel.setCarbs(_carbsController.text));
    _proteinController.addListener(() => _viewModel.setProtein(_proteinController.text));
    _fatController.addListener(() => _viewModel.setFat(_fatController.text));
    _waterController.addListener(() => _viewModel.setWaterAmount(_waterController.text));
  }

  void _initializeControllers() {
    _nameController.text = _viewModel.name;
    _caloriesPerPortionController.text = _viewModel.caloriesPerPortion;
    _portionSizeController.text = _viewModel.portionSize;
    _carbsController.text = _viewModel.carbs;
    _proteinController.text = _viewModel.protein;
    _fatController.text = _viewModel.fat;
  }

  void _initializeWaterController() {
    _waterController.text = _viewModel.waterAmount;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _caloriesPerPortionController.dispose();
    _portionSizeController.dispose();
    _carbsController.dispose();
    _proteinController.dispose();
    _fatController.dispose();
    _waterController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Save Retry')),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Entry Type', style: theme.textTheme.headlineSmall),
                        const Gap(AppSpacing.md),
                        Selector<CreateEntryViewModel, EntryType>(
                          selector: (context, viewModel) => viewModel.selectedType,
                          builder: (context, selectedType, child) {
                            return SegmentedButton(
                              segments:
                                  EntryType.values.map((type) {
                                    return ButtonSegment(value: type.value, label: Text(type.value));
                                  }).toList(),
                              selected: {selectedType.value},
                              onSelectionChanged: (value) {
                                _viewModel.setSelectedType(value.first);
                              },
                            );
                          },
                        ),
                        const Gap(AppSpacing.md),
                        Selector<CreateEntryViewModel, EntryType>(
                          selector: (context, viewModel) => viewModel.selectedType,
                          builder: (context, selectedType, child) {
                            if (selectedType == EntryType.food) {
                              return FoodEntryForm(
                                formKey: _foodFormKey,
                                nameController: _nameController,
                                caloriesPerPortionController: _caloriesPerPortionController,
                                portionSizeController: _portionSizeController,
                                carbsController: _carbsController,
                                proteinController: _proteinController,
                                fatController: _fatController,
                              );
                            } else {
                              return WaterEntryForm(
                                formKey: _waterFormKey,
                                waterController: _waterController,
                                onSelectedQuantity: _viewModel.setSelectedQuantity,
                              );
                            }
                          },
                        ),
                        const Gap(AppSpacing.xxxl),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: Selector<CreateEntryViewModel, bool>(
            selector: (context, viewModel) => viewModel.canSave,
            builder: (context, canSave, child) {
              return Selector<CreateEntryViewModel, bool>(
                selector: (context, viewModel) => viewModel.isSaving,
                builder: (context, isSaving, child) {
                  return FloatingActionButton.extended(
                    onPressed: canSave && !isSaving ? _saveEntry : _validateForms,
                    label: const Text('Save'),
                    icon: const Icon(Icons.check),
                  );
                },
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }

  void _validateForms() {
    _foodFormKey.currentState?.validate();
    _waterFormKey.currentState?.validate();
  }

  Future<void> _saveEntry() async {
    final success = await _viewModel.save();
    if (success && mounted) {
      context.pop();
    }
  }
}
