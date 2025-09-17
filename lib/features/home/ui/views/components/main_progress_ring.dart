import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';

class MainProgressRing extends StatefulWidget {
  const MainProgressRing({
    super.key,
    required this.progressPercentage,
    required this.topLabel,
    required this.middleLabel,
    required this.bottomLabel,
    required this.color,
    this.size,
    this.animationDuration = const Duration(milliseconds: 1500),
    this.curve = Curves.easeInOut,
  });

  final double progressPercentage;
  final String topLabel;
  final String middleLabel;
  final String bottomLabel;
  final Color color;
  final double? size;
  final Duration animationDuration;
  final Curve curve;

  @override
  State<MainProgressRing> createState() => _MainProgressRingState();
}

class _MainProgressRingState extends State<MainProgressRing> with SingleTickerProviderStateMixin {
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
  void didUpdateWidget(MainProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.progressPercentage != widget.progressPercentage) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: widget.progressPercentage,
      ).animate(CurvedAnimation(parent: _animationController, curve: widget.curve));

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
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: widget.size ?? 150,
              width: widget.size ?? 150,
              child: CircularProgressIndicator(
                strokeWidth: 12,
                strokeCap: StrokeCap.round,
                backgroundColor: theme.colorScheme.surfaceContainer,
                color: widget.color,
                value: _progressAnimation.value,
              ),
            ),
            if (child != null) child,
          ],
        );
      },
      child: Column(
        children: [
          Text(widget.topLabel, style: theme.textTheme.headlineLarge?.copyWith(color: widget.color, fontWeight: FontWeight.bold)),
          const SizedBox(height: AppSpacing.xs),
          Text(widget.middleLabel, style: theme.textTheme.bodyLarge),
          const SizedBox(height: AppSpacing.sm),
          Text(widget.bottomLabel, style: theme.textTheme.titleMedium?.copyWith(color: widget.color, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
