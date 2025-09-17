import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tea_challenge/features/user/data/data_source/user_local_data_source.dart';
import 'package:tea_challenge/features/user/data/models/user_data.dart';

class UserRepository {
  UserRepository({required this.userLocalDataSource});

  @visibleForTesting
  final UserLocalDataSource userLocalDataSource;

  final Logger _logger = Logger('UserRepository');

  final BehaviorSubject<UserData?> _userDataSubject = BehaviorSubject<UserData?>.seeded(null);
  ValueStream<UserData?> get currentUser => _userDataSubject.stream;

  Future<void> init() async {
    try {
      final value = await userLocalDataSource.loadUserData();

      if (value != null) {
        _userDataSubject.add(value);
      }
    } catch (e, s) {
      _logger.severe('Error initializing user repository', e, s);
    }
  }

  Future<void> saveUserData(UserData userData) async {
    try {
      await userLocalDataSource.updateUserData(userData);
      _userDataSubject.add(userData);
    } catch (e, s) {
      _logger.severe('Error saving user data', e, s);
    }
  }

  Future<void> deleteUserData() async {
    try {
      await userLocalDataSource.deleteUserData();
      _userDataSubject.add(null);
    } catch (e, s) {
      _logger.severe('Error deleting user data', e, s);
    }
  }

  void dispose() {
    _userDataSubject.close();
  }
}
