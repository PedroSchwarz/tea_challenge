import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tea_challenge/features/entries/entries.dart';
import 'package:tea_challenge/features/entries/ui/view_models/entry_type.dart';
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
          return const HomeScreen();
        },
        routes: [
          GoRoute(
            path: '/${CreateEntryScreen.routeName}',
            name: CreateEntryScreen.routeName,
            builder: (context, state) {
              final id = int.tryParse(state.uri.queryParameters['id'] ?? '');
              final type = EntryType.fromString(state.uri.queryParameters['type'] ?? '');
              return CreateEntryScreen(id: id, type: type);
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
