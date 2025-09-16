import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:tea_challenge/app/configurations/build_configuration.dart';
import 'package:tea_challenge/app/ui/navigation.dart';

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
    getIt.registerSingleton<BuildConfiguration>(buildConfiguration);
    getIt.registerSingleton<GoRouter>(createRouter());
  }
}
