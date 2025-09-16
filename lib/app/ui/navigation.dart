import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tea_challenge/features/home/home.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/${HomeScreen.routeName}',
    routes: [
      GoRoute(
        path: '/${HomeScreen.routeName}',
        name: HomeScreen.routeName,
        builder: (context, state) {
          final viewModel = context.read<HomeViewModel>();
          return HomeScreen(viewModel: viewModel);
        },
        routes: [
          GoRoute(
            path: '/details',
            name: 'details',
            builder: (context, state) {
              return const SizedBox();
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
