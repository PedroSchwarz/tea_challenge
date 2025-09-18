import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';
import 'package:tea_challenge/features/entries/data/repositories/food_record_repository.dart';
import 'package:tea_challenge/features/entries/data/repositories/water_record_repository.dart';
import 'package:tea_challenge/features/entries/domain/usecases/validate_numeric_field.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';

class CreateEntryViewModel extends ChangeNotifier {
  CreateEntryViewModel({required this.foodRecordRepository, required this.waterRecordRepository, required this.validateNumericField});

  @visibleForTesting
  final FoodRecordRepository foodRecordRepository;

  @visibleForTesting
  final WaterRecordRepository waterRecordRepository;

  @visibleForTesting
  final ValidateNumericField validateNumericField;

  final Logger _logger = Logger('CreateEntryViewModel');

  // Form state
  EntryType _selectedType = EntryType.food;
  WaterQuantity _selectedQuantity = WaterQuantity.halfLiter;
  bool _isLoading = false;
  bool _isSaving = false;
  int? _editingId;
  CreateEntryError? _error;
  // Food form fields
  String _name = '';
  String _caloriesPerPortion = '';
  String _portionSize = '';
  String _carbs = '';
  String _protein = '';
  String _fat = '';

  // Water form fields
  String _waterAmount = '';

  // Getters
  EntryType get selectedType => _selectedType;
  WaterQuantity get selectedQuantity => _selectedQuantity;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  CreateEntryError? get error => _error;
  // Food form getters
  String get name => _name;
  String get caloriesPerPortion => _caloriesPerPortion;
  String get portionSize => _portionSize;
  String get carbs => _carbs;
  String get protein => _protein;
  String get fat => _fat;

  // Water form getters
  String get waterAmount => _waterAmount;

  // Computed values
  double get totalCalories {
    final calories = double.tryParse(_caloriesPerPortion) ?? 0.0;
    final portion = double.tryParse(_portionSize) ?? 0.0;
    return calories * portion;
  }

  double get selectedWaterAmount {
    if (_selectedQuantity == WaterQuantity.custom) {
      return (double.tryParse(_waterAmount) ?? 0.0) * 1000;
    }
    return _selectedQuantity.amountInLiters * 1000;
  }

  // Validation
  bool get isFoodFormValid {
    return _name.isNotEmpty &&
        validateNumericField(_caloriesPerPortion) == NumericValidationResult.valid &&
        validateNumericField(_portionSize) == NumericValidationResult.valid &&
        validateNumericField(_carbs) == NumericValidationResult.valid &&
        validateNumericField(_protein) == NumericValidationResult.valid &&
        validateNumericField(_fat) == NumericValidationResult.valid;
  }

  bool get isWaterFormValid {
    if (_selectedQuantity != WaterQuantity.custom) {
      return true;
    }
    return validateNumericField(_waterAmount) == NumericValidationResult.valid;
  }

  bool get canSave {
    return _selectedType == EntryType.food ? isFoodFormValid : isWaterFormValid;
  }

  // Actions

  Future<void> load({required int id, required EntryType type}) async {
    _isLoading = true;
    notifyListeners();

    try {
      _editingId = id;
      _selectedType = type;
      if (type == EntryType.food) {
        await _loadFoodRecord(id);
      } else {
        await _loadWaterRecord(id);
      }
    } catch (e, s) {
      _logger.severe('Error loading entry', e, s);
      _error = CreateEntryError.loadEntry;
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadFoodRecord(int id) async {
    final record = await foodRecordRepository.getFoodRecord(id);
    if (record != null) {
      _name = record.name;
      _caloriesPerPortion = record.calories.toString();
      _portionSize = record.portionSize.toString();
      _carbs = record.carbs.toString();
      _protein = record.protein.toString();
      _fat = record.fat.toString();
    }
  }

  Future<void> _loadWaterRecord(int id) async {
    final record = await waterRecordRepository.getWaterRecord(id);
    if (record != null) {
      // Convert ml to liters for display
      final liters = record.amountInMl / 1000;
      _waterAmount = liters.toString();

      // Try to match with predefined quantities
      final matchingQuantity = WaterQuantity.values.firstWhere((q) => q.amountInLiters == liters, orElse: () => WaterQuantity.custom);
      _selectedQuantity = matchingQuantity;
    }
  }

  void setSelectedType(String type) {
    final entryType = EntryType.fromString(type);
    if (_selectedType != entryType) {
      _selectedType = entryType;
      notifyListeners();
    }
  }

  void setSelectedQuantity(String quantity) {
    final waterQuantity = WaterQuantity.fromString(quantity);
    if (_selectedQuantity != waterQuantity) {
      _selectedQuantity = waterQuantity;
      notifyListeners();
    }
  }

  void setName(String value) {
    if (_name != value) {
      _name = value;
      notifyListeners();
    }
  }

  void setCaloriesPerPortion(String value) {
    if (_caloriesPerPortion != value) {
      _caloriesPerPortion = value;
      notifyListeners();
    }
  }

  void setPortionSize(String value) {
    if (_portionSize != value) {
      _portionSize = value;
      notifyListeners();
    }
  }

  void setCarbs(String value) {
    if (_carbs != value) {
      _carbs = value;
      notifyListeners();
    }
  }

  void setProtein(String value) {
    if (_protein != value) {
      _protein = value;
      notifyListeners();
    }
  }

  void setFat(String value) {
    if (_fat != value) {
      _fat = value;
      notifyListeners();
    }
  }

  void setWaterAmount(String value) {
    if (_waterAmount != value) {
      _waterAmount = value;
      notifyListeners();
    }
  }

  Future<bool> save() async {
    if (!canSave) return false;

    _isSaving = true;
    notifyListeners();

    try {
      if (_selectedType == EntryType.food) {
        await _saveFoodRecord();
      } else {
        await _saveWaterRecord();
      }
      return true;
    } catch (e, s) {
      _logger.severe('Error saving entry', e, s);
      _error = CreateEntryError.saveEntry;
      return false;
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  Future<void> _saveFoodRecord() async {
    final record = FoodRecord(
      id: _editingId,
      name: _name,
      calories: double.parse(_caloriesPerPortion),
      portionSize: double.parse(_portionSize),
      carbs: double.parse(_carbs),
      protein: double.parse(_protein),
      fat: double.parse(_fat),
      createdAt: DateTime.now(),
    );

    if (_editingId != null) {
      await foodRecordRepository.updateFoodRecord(record);
    } else {
      await foodRecordRepository.insertFoodRecord(record);
    }
  }

  Future<void> _saveWaterRecord() async {
    final record = WaterRecord(id: _editingId, amountInMl: selectedWaterAmount, createdAt: DateTime.now());

    if (_editingId != null) {
      await waterRecordRepository.updateWaterRecord(record);
    } else {
      await waterRecordRepository.insertWaterRecord(record);
    }
  }

  void reset() {
    _selectedType = EntryType.food;
    _selectedQuantity = WaterQuantity.halfLiter;
    _name = '';
    _caloriesPerPortion = '';
    _portionSize = '';
    _carbs = '';
    _protein = '';
    _fat = '';
    _waterAmount = '';
    _isLoading = false;
    _isSaving = false;
    _editingId = null;
    notifyListeners();
  }

  void resetError() {
    _error = null;
    notifyListeners();
  }
}

enum CreateEntryError { saveEntry, loadEntry }
