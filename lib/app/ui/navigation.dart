import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const SizedBox(),
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
