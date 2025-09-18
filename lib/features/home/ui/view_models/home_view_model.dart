import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/models/entry.dart';
import 'package:tea_challenge/features/entries/data/models/food_progress.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';
import 'package:tea_challenge/features/entries/data/models/water_progress.dart';
import 'package:tea_challenge/features/entries/data/models/water_record.dart';
import 'package:tea_challenge/features/entries/data/repositories/food_record_repository.dart';
import 'package:tea_challenge/features/entries/data/repositories/water_record_repository.dart';
import 'package:tea_challenge/features/history/history.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_filter_type.dart';
import 'package:tea_challenge/features/user/user.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required this.foodRecordRepository,
    required this.waterRecordRepository,
    required this.userRepository,
    required this.historyRepository,
  });

  @visibleForTesting
  final FoodRecordRepository foodRecordRepository;

  @visibleForTesting
  final WaterRecordRepository waterRecordRepository;

  @visibleForTesting
  final UserRepository userRepository;

  @visibleForTesting
  final HistoryRepository historyRepository;

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
  final Map<DateTime, List<Entry>> _entriesByDate = {};
  bool _showDeleteEntryDialog = false;
  Entry? _entryToDelete;
  bool _showUndoDeleteEntry = false;
  List<HistoryData> _historyData = [];
  DateTime _selectedDate = DateUtils.dateOnly(DateTime.now());

  // Cached data for last 3 days
  final Map<DateTime, List<FoodRecord>> _cachedFoodRecords = {};
  final Map<DateTime, List<WaterRecord>> _cachedWaterRecords = {};
  final Map<DateTime, FoodProgress> _cachedFoodProgress = {};
  final Map<DateTime, WaterProgress> _cachedWaterProgress = {};

  // Getters
  bool get isLoading => _isLoading;
  bool get isRefreshing => _isRefreshing;
  UserData get userData => _userData;
  FoodProgress get foodProgress => _cachedFoodProgress[_selectedDate] ?? _foodProgress;
  WaterProgress get waterProgress => _cachedWaterProgress[_selectedDate] ?? _waterProgress;
  List<FoodRecord> get foodRecords => _cachedFoodRecords[_selectedDate] ?? _foodRecords;
  List<WaterRecord> get waterRecords => _cachedWaterRecords[_selectedDate] ?? _waterRecords;
  HomeFilterType get selectedSegment => _selectedSegment;
  List<Entry> get entries {
    final selectedEntries = _entriesByDate[_selectedDate] ?? [];
    return switch (_selectedSegment) {
      HomeFilterType.water => selectedEntries.whereType<WaterEntry>().toList(),
      HomeFilterType.food => selectedEntries.whereType<FoodEntry>().toList(),
      HomeFilterType.all => selectedEntries,
    };
  }

  Entry? get entryToDelete => _entryToDelete;
  bool get showDeleteEntryDialog => _showDeleteEntryDialog;
  bool get noRecords => entries.isEmpty;
  bool get showUndoDeleteEntry => _showUndoDeleteEntry;
  List<HistoryData> get historyData => _historyData;
  DateTime get selectedDate => _selectedDate;
  bool get areActionsEnabled => selectedDate == DateUtils.dateOnly(DateTime.now());

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    await _loadUser();
    await _loadLast3DaysData();
    await _loadHistoryData();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() async {
    _isRefreshing = true;
    notifyListeners();

    await _loadUser();
    await _loadLast3DaysData();
    await _loadHistoryData();

    _isRefreshing = false;
    notifyListeners();
  }

  /// Loads data for the last 3 days and caches it
  Future<void> _loadLast3DaysData() async {
    try {
      final now = DateTime.now();
      final dates = [
        DateUtils.dateOnly(now),
        DateUtils.dateOnly(now.subtract(const Duration(days: 1))),
        DateUtils.dateOnly(now.subtract(const Duration(days: 2))),
      ];

      // Load data for all 3 days in parallel
      final requests = dates.map(_loadDataForDate);
      await Future.wait(requests);

      // Set current data to today's data
      _foodRecords = _cachedFoodRecords[dates[0]] ?? [];
      _waterRecords = _cachedWaterRecords[dates[0]] ?? [];
      _foodProgress = _cachedFoodProgress[dates[0]] ?? _foodProgress;
      _waterProgress = _cachedWaterProgress[dates[0]] ?? _waterProgress;

      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading last 3 days data', e, s);
    }
  }

  /// Loads all data for a specific date and caches it
  Future<void> _loadDataForDate(DateTime date) async {
    try {
      // Load records
      final foodRecords = await foodRecordRepository.getFoodRecords(date: date);
      final waterRecords = await waterRecordRepository.getWaterRecords(date: date);

      // Load progress
      final foodProgress = await foodRecordRepository.getFoodProgressForDate(
        date: date,
        caloriesGoal: _userData.caloriesGoal,
        carbsGoal: _userData.carbsGoal,
        proteinGoal: _userData.proteinGoal,
        fatGoal: _userData.fatGoal,
      );

      final waterProgress = await waterRecordRepository.getWaterProgressForDate(date: date, goalInLiters: _userData.waterGoal);

      // Cache the data
      _cachedFoodRecords[date] = foodRecords;
      _cachedWaterRecords[date] = waterRecords;
      _cachedFoodProgress[date] = foodProgress;
      _cachedWaterProgress[date] = waterProgress;

      // Create and cache entries
      final entries = <Entry>[];
      entries.addAll(foodRecords.map(Entry.food));
      entries.addAll(waterRecords.map(Entry.water));
      entries.sort((a, b) {
        final aDate = a.createdAt ?? DateTime.now();
        final bDate = b.createdAt ?? DateTime.now();
        return bDate.compareTo(aDate);
      });
      _entriesByDate[date] = entries;
    } catch (e, s) {
      _logger.severe('Error loading data for date $date', e, s);
    }
  }

  void setSelectedSegment(HomeFilterType value) {
    if (_selectedSegment != value) {
      _selectedSegment = value;
      notifyListeners();
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
            try {
              await foodRecordRepository.deleteFoodRecord(foodRecord.id!);
              await _updateCacheForDate(_selectedDate);
              await _loadHistoryData();
              setShowUndoDeleteEntry(false);
              resetEntryToDelete();
            } catch (e, s) {
              _logger.severe('Error deleting food record', e, s);
            }
          }
        case WaterEntry(waterRecord: final waterRecord):
          if (waterRecord.id != null) {
            try {
              await waterRecordRepository.deleteWaterRecord(waterRecord.id!);
              await _updateCacheForDate(_selectedDate);
              await _loadHistoryData();
              setShowUndoDeleteEntry(false);
              resetEntryToDelete();
            } catch (e, s) {
              _logger.severe('Error deleting water record', e, s);
            }
          }
      }
    });

    setShowUndoDeleteEntry(true);

    // Update in-memory progress immediately for instant UI feedback
    switch (entry) {
      case FoodEntry(foodRecord: final foodRecord):
        _foodProgress = _foodProgress.copyWith(
          totalCalories: _foodProgress.totalCalories - foodRecord.totalCalories,
          totalCarbs: _foodProgress.totalCarbs - foodRecord.totalCarbs,
          totalProtein: _foodProgress.totalProtein - foodRecord.totalProtein,
          totalFat: _foodProgress.totalFat - foodRecord.totalFat,
        );
        // Update cached progress for selected date
        final cachedFood = _cachedFoodProgress[_selectedDate];
        if (cachedFood != null) {
          _cachedFoodProgress[_selectedDate] = cachedFood.copyWith(
            totalCalories: cachedFood.totalCalories - foodRecord.totalCalories,
            totalCarbs: cachedFood.totalCarbs - foodRecord.totalCarbs,
            totalProtein: cachedFood.totalProtein - foodRecord.totalProtein,
            totalFat: cachedFood.totalFat - foodRecord.totalFat,
          );
        }
        // Update cached records for selected date
        final cachedFoodRecords = _cachedFoodRecords[_selectedDate];
        if (cachedFoodRecords != null) {
          _cachedFoodRecords[_selectedDate] = List.of(cachedFoodRecords)..remove(foodRecord);
        }
      case WaterEntry(waterRecord: final waterRecord):
        _waterProgress = _waterProgress.copyWith(totalAmountInMl: _waterProgress.totalAmountInMl - waterRecord.amountInMl);
        final cachedWater = _cachedWaterProgress[_selectedDate];
        if (cachedWater != null) {
          _cachedWaterProgress[_selectedDate] = cachedWater.copyWith(totalAmountInMl: cachedWater.totalAmountInMl - waterRecord.amountInMl);
        }
        final cachedWaterRecords = _cachedWaterRecords[_selectedDate];
        if (cachedWaterRecords != null) {
          _cachedWaterRecords[_selectedDate] = List.of(cachedWaterRecords)..remove(waterRecord);
        }
    }

    // Update entries for selected date and notify
    final currentEntries = _entriesByDate[_selectedDate] ?? [];
    currentEntries.remove(entry);
    _entriesByDate[_selectedDate] = currentEntries;
    notifyListeners();
  }

  void undoDeleteEntry() {
    _deleteEntryTimer?.cancel();
    _deleteEntryTimer = null;
    setShowUndoDeleteEntry(false);

    final entry = _entryToDelete;

    if (entry != null) {
      // Add entry back to the current date's entries
      final currentEntries = _entriesByDate[_selectedDate] ?? [];
      currentEntries.add(entry);
      _sortEntries();
      _entriesByDate[_selectedDate] = currentEntries;

      // Update cache for the current date
      _updateCacheForDate(_selectedDate);
    }

    resetEntryToDelete();
    notifyListeners();
  }

  void _sortEntries() {
    final currentEntries = _entriesByDate[_selectedDate] ?? [];
    currentEntries.sort((a, b) {
      final aDate = a.createdAt ?? DateTime.now();
      final bDate = b.createdAt ?? DateTime.now();
      return bDate.compareTo(aDate);
    });
    _entriesByDate[_selectedDate] = currentEntries;
  }

  /// Updates cache for a specific date by reloading its data
  Future<void> _updateCacheForDate(DateTime date) async {
    try {
      // Load fresh data for the date
      final foodRecords = await foodRecordRepository.getFoodRecords(date: date);
      final waterRecords = await waterRecordRepository.getWaterRecords(date: date);

      final foodProgress = await foodRecordRepository.getFoodProgressForDate(
        date: date,
        caloriesGoal: _userData.caloriesGoal,
        carbsGoal: _userData.carbsGoal,
        proteinGoal: _userData.proteinGoal,
        fatGoal: _userData.fatGoal,
      );

      final waterProgress = await waterRecordRepository.getWaterProgressForDate(date: date, goalInLiters: _userData.waterGoal);

      // Update cache
      _cachedFoodRecords[date] = foodRecords;
      _cachedWaterRecords[date] = waterRecords;
      _cachedFoodProgress[date] = foodProgress;
      _cachedWaterProgress[date] = waterProgress;

      // Update entries
      final entries = <Entry>[];
      entries.addAll(foodRecords.map(Entry.food));
      entries.addAll(waterRecords.map(Entry.water));
      entries.sort((a, b) {
        final aDate = a.createdAt ?? DateTime.now();
        final bDate = b.createdAt ?? DateTime.now();
        return bDate.compareTo(aDate);
      });
      _entriesByDate[date] = entries;

      // Update current data if this is the selected date
      if (date == _selectedDate) {
        _foodRecords = foodRecords;
        _waterRecords = waterRecords;
        _foodProgress = foodProgress;
        _waterProgress = waterProgress;
      }

      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error updating cache for date $date', e, s);
    }
  }

  void setShowUndoDeleteEntry(bool value) {
    _showUndoDeleteEntry = value;
    notifyListeners();
  }

  Future<void> _loadHistoryData() async {
    try {
      _historyData = await historyRepository.getHistoryData(caloriesGoal: _userData.caloriesGoal, waterGoal: _userData.waterGoal, days: 3);
      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading history data', e, s);
    }
  }

  /// Selects a specific date and switches to cached data for that date
  Future<void> selectDate(DateTime date) async {
    final normalizedDate = DateUtils.dateOnly(date);
    _selectedDate = normalizedDate;

    // If data is not cached, load it
    if (!_cachedFoodRecords.containsKey(normalizedDate)) {
      await _loadDataForDate(normalizedDate);
    }

    notifyListeners();
  }

  /// Resets to today's date and loads current data
  Future<void> resetToToday() async {
    _selectedDate = DateUtils.dateOnly(DateTime.now());
    await load();
  }

  @override
  void dispose() {
    userRepository.dispose();
    super.dispose();
  }
}
