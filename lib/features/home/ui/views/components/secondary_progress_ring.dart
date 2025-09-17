import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';

class SecondaryProgressRing extends StatefulWidget {
  const SecondaryProgressRing({
    super.key,
    required this.progressPercentage,
    required this.totalLabel,
    required this.goalLabel,
    required this.description,
    required this.color,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeInOut,
  });

  final double progressPercentage;
  final String totalLabel;
  final String goalLabel;
  final String description;
  final Color color;
  final Duration animationDuration;
  final Curve curve;

  @override
  State<SecondaryProgressRing> createState() => _SecondaryProgressRingState();
}

class _SecondaryProgressRingState extends State<SecondaryProgressRing> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: widget.animationDuration, vsync: this);

    _progressAnimation = Tween<double>(
      begin: 0.0,
      end: widget.progressPercentage,
    ).animate(CurvedAnimation(parent: _animationController, curve: widget.curve));

    // Start animation when widget is built
    _animationController.forward();
  }

  @override
  void didUpdateWidget(SecondaryProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressPercentage != widget.progressPercentage) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: widget.progressPercentage,
      ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

      _animationController.reset();
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _progressAnimation,
      builder: (context, child) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    strokeCap: StrokeCap.round,
                    backgroundColor: theme.colorScheme.surfaceContainer,
                    color: widget.color,
                    value: _progressAnimation.value,
                  ),
                ),
                Text(widget.goalLabel, style: theme.textTheme.titleMedium),
              ],
            ),
            if (child != null) child,
          ],
        );
      },
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.xs),
          Text(widget.totalLabel, style: theme.textTheme.titleMedium?.copyWith(color: widget.color)),
          Text(widget.description, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
