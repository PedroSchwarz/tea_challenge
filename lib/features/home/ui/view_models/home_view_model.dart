import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:tea_challenge/features/entries/data/models/food_progress.dart';
import 'package:tea_challenge/features/entries/data/models/food_record.dart';
import 'package:tea_challenge/features/entries/data/repositories/food_record_repository.dart';
import 'package:tea_challenge/features/user/user.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.foodRecordRepository, required this.userRepository});

  @visibleForTesting
  final FoodRecordRepository foodRecordRepository;

  @visibleForTesting
  final UserRepository userRepository;

  final Logger _logger = Logger('HomeViewModel');

  // State
  bool _isLoading = false;
  bool _isRefreshing = false;
  UserData _userData = const UserData(name: 'User!', caloriesGoal: 2000, carbsGoal: 100, proteinGoal: 190, fatGoal: 50, waterGoal: 4.5);
  FoodProgress _foodProgress = const FoodProgress(calories: 0, carbs: 0, protein: 0, fat: 0);
  List<FoodRecord> _foodRecords = [];

  // Getter
  bool get isLoading => _isLoading;
  bool get isRefreshing => _isRefreshing;
  UserData get userData => _userData;
  FoodProgress get foodProgress => _foodProgress;
  List<FoodRecord> get foodRecords => _foodRecords;

  bool get noRecords => foodRecords.isEmpty;

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();

    await _loadUser();
    await _loadFoodProgress();
    await _loadFoodRecords();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadFoodProgress() async {
    try {
      _foodProgress = await foodRecordRepository.getTotalCaloriesForToday();
      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading food progress', e, s);
    }
  }

  Future<void> _loadFoodRecords() async {
    try {
      _foodRecords = await foodRecordRepository.getFoodRecords();
      notifyListeners();
    } catch (e, s) {
      _logger.severe('Error loading food records', e, s);
    }
  }

  Future<void> _loadUser() async {
    try {
      await userRepository.init();
      _userData =
          userRepository.currentUser.value ??
          const UserData(name: 'User', caloriesGoal: 2000, carbsGoal: 100, proteinGoal: 190, fatGoal: 50, waterGoal: 4.5);
    } catch (e, s) {
      _logger.severe('Error loading user', e, s);
    }
  }

  @override
  void dispose() {
    userRepository.dispose();
    super.dispose();
  }
}
