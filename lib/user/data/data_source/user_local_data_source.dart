import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tea_challenge/app/storage/app_local_secure_storage.dart';
import 'package:tea_challenge/user/data/models/user_data.dart';

class UserLocalDataSource {
  UserLocalDataSource({required this.appLocalStorage});

  @visibleForTesting
  final AppLocalStorage appLocalStorage;

  Future<UserData?> loadUserData() async {
    final userData = await appLocalStorage.read(LocalStorageKey.userData);
    return userData != null ? UserData.fromJson(jsonDecode(userData)) : null;
  }

  Future<void> updateUserData(UserData userData) async {
    await appLocalStorage.write(LocalStorageKey.userData, jsonEncode(userData.toJson()));
  }

  Future<void> deleteUserData() async {
    await appLocalStorage.delete(LocalStorageKey.userData);
  }
}
