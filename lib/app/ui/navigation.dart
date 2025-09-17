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
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: CreateEntryScreen(
                  id: int.tryParse(state.uri.queryParameters['id'] ?? ''),
                  type: EntryType.fromString(state.uri.queryParameters['type'] ?? ''),
                ),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0); // Start from the bottom
                  const end = Offset.zero; // End at the center
                  const curve = Curves.easeOut;

                  final tween = Tween(begin: begin, end: end);
                  final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);

                  return SlideTransition(position: tween.animate(curvedAnimation), child: child);
                },
              );
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
