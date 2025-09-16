import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/app/app.dart';
import 'package:tea_challenge/features/home/ui/view_models/home_view_model.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => getIt<HomeViewModel>())],
      child: MaterialApp.router(
        title: 'Lifter',
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: getIt<GoRouter>(),
      ),
    );
  }
}
