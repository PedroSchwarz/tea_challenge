import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppLocalStorage {
  Future<void> create();
  Future<void> write(Enum key, String value);
  Future<String?> read(Enum key);
  Future<void> delete(Enum key);
}

class AppLocalStorageImpl implements AppLocalStorage {
  AppLocalStorageImpl({required this.secureStorage, required this.sharedPreferences});

  @visibleForTesting
  final FlutterSecureStorage secureStorage;

  @visibleForTesting
  final SharedPreferences sharedPreferences;

  @override
  Future<void> create() async {
    final isFirstRun = sharedPreferences.getBool('isFirstRun') ?? true;
    if (isFirstRun) {
      await secureStorage.deleteAll();
      await sharedPreferences.setBool('isFirstRun', false);
    }
  }

  @override
  Future<void> write(Enum key, String value) async {
    await secureStorage.write(key: key.name, value: value);
  }

  @override
  Future<String?> read(Enum key) async {
    return secureStorage.read(key: key.name);
  }

  @override
  Future<void> delete(Enum key) async {
    await secureStorage.delete(key: key.name);
  }
}

enum LocalStorageKey { userData }
