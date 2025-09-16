import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea_challenge/app/configurations/build_configuration.dart';
import 'package:tea_challenge/app/database/app_database.dart';
import 'package:tea_challenge/app/storage/app_local_secure_storage.dart';
import 'package:tea_challenge/app/ui/navigation.dart';
import 'package:tea_challenge/features/entries/entries.dart';
import 'package:tea_challenge/features/home/home.dart';
import 'package:tea_challenge/features/user/user.dart';

final getIt = GetIt.instance;

abstract class BaseServiceLocator {
  BuildConfiguration get buildConfiguration;

  @mustCallSuper
  Future<void> setup();
}

class MainLocator extends BaseServiceLocator {
  @override
  BuildConfiguration get buildConfiguration => const BuildConfiguration(environment: Environment.development);

  @override
  Future<void> setup() async {
    const secureStorage = FlutterSecureStorage(
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock_this_device),
      aOptions: AndroidOptions(sharedPreferencesName: 'tea_challenge_secure_storage', encryptedSharedPreferences: true),
    );

    final sharedPreferences = await SharedPreferences.getInstance();

    getIt.registerSingleton<FlutterSecureStorage>(secureStorage);
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);

    final appLocalStorage = AppLocalStorage(secureStorage: secureStorage, sharedPreferences: sharedPreferences);
    await appLocalStorage.create();

    /// App Dependencies
    getIt.registerSingleton<BuildConfiguration>(buildConfiguration);
    getIt.registerSingleton<AppLocalStorage>(appLocalStorage);
    getIt.registerSingleton<GoRouter>(createRouter());
    getIt.registerSingleton<AppDatabase>(AppDatabase());

    /// User Dependencies
    getIt.registerSingleton<UserLocalDataSource>(UserLocalDataSource(appLocalStorage: appLocalStorage));
    getIt.registerSingleton<UserRepository>(UserRepository(userLocalDataSource: getIt<UserLocalDataSource>()));

    /// Home Dependencies
    getIt.registerSingleton<FoodRecordManager>(getIt<AppDatabase>().managers.foodRecordEntry);
    getIt.registerSingleton<WaterRecordManager>(getIt<AppDatabase>().managers.waterRecordEntry);
    getIt.registerSingleton<FoodLocalDataSource>(FoodLocalDataSourceImpl(manager: getIt<FoodRecordManager>()));
    getIt.registerSingleton<WaterLocalDataSource>(WaterLocalDataSourceImpl(manager: getIt<WaterRecordManager>()));
    getIt.registerSingleton<FoodRecordRepository>(FoodRecordRepository(foodLocalDataSource: getIt<FoodLocalDataSource>()));
    getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(foodRecordRepository: getIt<FoodRecordRepository>(), userRepository: getIt<UserRepository>()),
    );
  }
}
