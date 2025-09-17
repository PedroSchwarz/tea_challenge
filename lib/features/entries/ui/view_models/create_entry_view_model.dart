import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';
import 'package:tea_challenge/features/entries/data/repositories/food_record_repository.dart';
import 'package:tea_challenge/features/entries/data/repositories/water_record_repository.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';

class CreateEntryViewModel extends ChangeNotifier {
  CreateEntryViewModel({required this.foodRecordRepository, required this.waterRecordRepository});

  @visibleForTesting
  final FoodRecordRepository foodRecordRepository;

  @visibleForTesting
  final WaterRecordRepository waterRecordRepository;

  final Logger _logger = Logger('CreateEntryViewModel');

  // Form state
  EntryType _selectedType = EntryType.food;
  WaterQuantity _selectedQuantity = WaterQuantity.halfLiter;
  bool _isLoading = false;
  bool _isSaving = false;

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
        _caloriesPerPortion.isNotEmpty &&
        _portionSize.isNotEmpty &&
        _carbs.isNotEmpty &&
        _protein.isNotEmpty &&
        _fat.isNotEmpty;
  }

  bool get isWaterFormValid {
    return _selectedQuantity != WaterQuantity.custom || _waterAmount.isNotEmpty;
  }

  bool get canSave {
    return _selectedType == EntryType.food ? isFoodFormValid : isWaterFormValid;
  }

  // Actions

  Future<void> load({required int id, required EntryType type}) async {
    _selectedType = type;
    if (type == EntryType.food) {
      await _loadFoodRecord(id);
    } else {
      await _loadWaterRecord(id);
    }
    notifyListeners();
  }

  Future<void> _loadFoodRecord(int id) async {
    final record = await foodRecordRepository.getFoodRecord(id);
    if (record != null) {
      _name = record.name;
      _caloriesPerPortion = record.caloriesPerPortion.toString();
      _portionSize = record.portionSize.toString();
      _carbs = record.carbs.toString();
      _protein = record.protein.toString();
      _fat = record.fat.toString();
    }
  }

  Future<void> _loadWaterRecord(int id) async {
    final record = await waterRecordRepository.getWaterRecord(id);
    if (record != null) {
      _waterAmount = record.amountInMl.toString();
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
      return false;
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  Future<void> _saveFoodRecord() async {
    final record = FoodRecord(
      name: _name,
      caloriesPerPortion: double.parse(_caloriesPerPortion),
      portionSize: double.parse(_portionSize),
      carbs: double.parse(_carbs),
      protein: double.parse(_protein),
      fat: double.parse(_fat),
      createdAt: DateTime.now(),
    );

    await foodRecordRepository.insertFoodRecord(record);
  }

  Future<void> _saveWaterRecord() async {
    final record = WaterRecord(amountInMl: selectedWaterAmount);

    await waterRecordRepository.insertWaterRecord(record);
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
    notifyListeners();
  }
}
