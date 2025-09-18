import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';

typedef AppResponsiveLayoutBuilder = Widget Function(BuildContext context, BoxConstraints constraints, bool isLandscape, double maxWidth);

class AppResponsiveLayout extends StatelessWidget {
  const AppResponsiveLayout({super.key, required this.builder});

  final AppResponsiveLayoutBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLandscape = constraints.maxWidth > AppSpacing.maxWidthLandscape;
        final maxWidth = isLandscape ? AppSpacing.maxWidthLandscape : constraints.maxWidth;
        return builder(context, constraints, isLandscape, maxWidth);
      },
    );
  }
}
