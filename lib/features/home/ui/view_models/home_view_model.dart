import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/models/entry.dart';
import 'package:tea_challenge/features/entries/data/models/food_progress.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';
import 'package:tea_challenge/features/entries/data/models/water_progress.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';
import 'package:tea_challenge/features/entries/data/repositories/food_record_repository.dart';
import 'package:tea_challenge/features/entries/data/repositories/water_record_repository.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_filter_type.dart';
import 'package:tea_challenge/features/user/user.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.foodRecordRepository, required this.waterRecordRepository, required this.userRepository});

  @visibleForTesting
  final FoodRecordRepository foodRecordRepository;

  @visibleForTesting
  final WaterRecordRepository waterRecordRepository;

  @visibleForTesting
  final UserRepository userRepository;

  final Logger _logger = Logger('HomeViewModel');

  final undoDeleteEntryDuration = const Duration(seconds: 5);

  // Timer for deleting entry
  Timer? _deleteEntryTimer;

  // State
  bool _isLoading = false;
  bool _isRefreshing = false;
  UserData _userData = const UserData(
    name: 'User',
    caloriesGoal: 2000,
    carbsGoal: 100,
    proteinGoal: 190,
    fatGoal: 50,
    waterGoal: 4.5,
    wasUpdated: false,
  );
  FoodProgress _foodProgress = const FoodProgress(
    totalCalories: 0,
    totalCarbs: 0,
    totalProtein: 0,
    totalFat: 0,
    caloriesGoal: 2000,
    carbsGoal: 100,
    proteinGoal: 190,
    fatGoal: 50,
  );
  WaterProgress _waterProgress = const WaterProgress(totalAmountInMl: 0, goalInLiters: 4.5);
  List<FoodRecord> _foodRecords = [];
  List<WaterRecord> _waterRecords = [];
  HomeFilterType _selectedSegment = HomeFilterType.all;
  List<Entry> _entries = [];
  bool _showDeleteEntryDialog = false;
  Entry? _entryToDelete;
  bool _showUndoDeleteEntry = false;

  // Getters
  bool get isLoading => _isLoading;
  bool get isRefreshing => _isRefreshing;
  UserData get userData => _userData;
  FoodProgress get foodProgress => _foodProgress;
  WaterProgress get waterProgress => _waterProgress;
  List<FoodRecord> get foodRecords => _foodRecords;
  List<WaterRecord> get waterRecords => _waterRecords;
  HomeFilterType get selectedSegment => _selectedSegment;
  List<Entry> get entries => switch (_selectedSegment) {
    HomeFilterType.water => _waterRecords.map(Entry.water).toList(),
    HomeFilterType.food => _foodRecords.map(Entry.food).toList(),
    HomeFilterType.all => _entries,
  };
  Entry? get entryToDelete => _entryToDelete;
  bool get showDeleteEntryDialog => _showDeleteEntryDialog;
  bool get noRecords => entries.isEmpty;
  bool get showUndoDeleteEntry => _showUndoDeleteEntry;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    await Future.wait([_loadUser(), _loadFoodRecords(), _loadWaterRecords()]);
    await Future.wait([_loadFoodProgress(), _loadWaterProgress(), _loadEntries()]);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    _isRefreshing = true;
    notifyListeners();

    await Future.wait([_loadUser(), _loadFoodRecords(), _loadWaterRecords()]);
    await Future.wait([_loadFoodProgress(), _loadWaterProgress(), _loadEntries()]);

    _isRefreshing = false;
    notifyListeners();
  }

  Future<void> _loadFoodProgress() async {
    try {
      _foodProgress = await foodRecordRepository.getFoodProgressForToday(
        caloriesGoal: _userData.caloriesGoal,
        carbsGoal: _userData.carbsGoal,
        proteinGoal: _userData.proteinGoal,
        fatGoal: _userData.fatGoal,
      );
      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading enhanced food progress', e, s);
    }
  }

  Future<void> _loadWaterProgress() async {
    try {
      _waterProgress = await waterRecordRepository.getWaterProgressForToday(_userData.waterGoal);
      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading water progress', e, s);
    }
  }

  Future<void> _loadFoodRecords() async {
    try {
      _foodRecords = await foodRecordRepository.getFoodRecords(date: DateTime.now());
      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading food records', e, s);
    }
  }

  Future<void> _loadWaterRecords() async {
    try {
      _waterRecords = await waterRecordRepository.getWaterRecords(date: DateTime.now());
      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading water records', e, s);
    }
  }

  void setSelectedSegment(HomeFilterType value) {
    if (_selectedSegment != value) {
      _selectedSegment = value;
      notifyListeners();
    }
  }

  Future<void> _loadEntries() async {
    try {
      final foodEntries = _foodRecords.map(Entry.food).toList();
      final waterEntries = _waterRecords.map(Entry.water).toList();

      _entries = [...foodEntries, ...waterEntries];

      // Sort by creation date (most recent first)
      _entries.sort((a, b) {
        final aDate = a.createdAt ?? DateTime(1970);
        final bDate = b.createdAt ?? DateTime(1970);
        return bDate.compareTo(aDate);
      });

      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading entries', e, s);
    }
  }

  Future<void> _loadUser() async {
    try {
      await userRepository.init();
      final currentUser = userRepository.currentUser.value;
      if (currentUser != null) {
        _userData = currentUser;
      }
    } catch (e, s) {
      _logger.severe('Error loading user', e, s);
    }
  }

  void setEntryToDelete(Entry entry) {
    _entryToDelete = entry;
    _showDeleteEntryDialog = true;
    notifyListeners();
  }

  void resetEntryToDelete() {
    _entryToDelete = null;
    _showDeleteEntryDialog = false;
    notifyListeners();
  }

  Future<void> deleteEntry() async {
    _deleteEntryTimer?.cancel();

    final entry = _entryToDelete;

    if (entry == null) {
      return;
    }

    _deleteEntryTimer = Timer(undoDeleteEntryDuration, () async {
      switch (entry) {
        case FoodEntry(foodRecord: final foodRecord):
          if (foodRecord.id != null) {
            await foodRecordRepository.deleteFoodRecord(foodRecord.id!);
            await _loadFoodProgress();
            setShowUndoDeleteEntry(false);
            resetEntryToDelete();
          }
        case WaterEntry(waterRecord: final waterRecord):
          if (waterRecord.id != null) {
            await waterRecordRepository.deleteWaterRecord(waterRecord.id!);
            await _loadWaterProgress();
            setShowUndoDeleteEntry(false);
            resetEntryToDelete();
          }
      }
    });

    setShowUndoDeleteEntry(true);

    switch (entry) {
      case FoodEntry(foodRecord: final foodRecord):
        _foodProgress = _foodProgress.copyWith(
          totalCalories: _foodProgress.totalCalories - foodRecord.caloriesPerPortion * foodRecord.portionSize,
          totalCarbs: _foodProgress.totalCarbs - foodRecord.carbs,
          totalProtein: _foodProgress.totalProtein - foodRecord.protein,
          totalFat: _foodProgress.totalFat - foodRecord.fat,
        );
      case WaterEntry(waterRecord: final waterRecord):
        _waterProgress = _waterProgress.copyWith(totalAmountInMl: _waterProgress.totalAmountInMl - waterRecord.amountInMl);
    }

    _entries.remove(entry);
    notifyListeners();
  }

  void undoDeleteEntry() {
    _deleteEntryTimer?.cancel();
    _deleteEntryTimer = null;
    setShowUndoDeleteEntry(false);

    if (_entryToDelete != null) {
      _entries.add(_entryToDelete!);
      _entries.sort((a, b) {
        final aDate = a.createdAt ?? DateTime.now();
        final bDate = b.createdAt ?? DateTime.now();
        return bDate.compareTo(aDate);
      });
      switch (_entryToDelete) {
        case FoodEntry(foodRecord: final foodRecord):
          _foodProgress = _foodProgress.copyWith(
            totalCalories: _foodProgress.totalCalories + foodRecord.caloriesPerPortion * foodRecord.portionSize,
            totalCarbs: _foodProgress.totalCarbs + foodRecord.carbs,
            totalProtein: _foodProgress.totalProtein + foodRecord.protein,
            totalFat: _foodProgress.totalFat + foodRecord.fat,
          );
        case WaterEntry(waterRecord: final waterRecord):
          _waterProgress = _waterProgress.copyWith(totalAmountInMl: _waterProgress.totalAmountInMl + waterRecord.amountInMl);
      }
    }

    resetEntryToDelete();
    notifyListeners();
  }

  void setShowUndoDeleteEntry(bool value) {
    _showUndoDeleteEntry = value;
    notifyListeners();
  }

  @override
  void dispose() {
    userRepository.dispose();
    super.dispose();
  }
}
