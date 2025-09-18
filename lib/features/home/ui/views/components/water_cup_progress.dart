import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tea_challenge/app/theming/app_spacing.dart';

class WaterCupProgress extends StatefulWidget {
  const WaterCupProgress({
    super.key,
    required this.progressPercentage,
    required this.topLabel,
    required this.middleLabel,
    required this.bottomLabel,
    required this.color,
    this.size,
    this.animationDuration = const Duration(milliseconds: 2000),
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
  State<WaterCupProgress> createState() => _WaterCupProgressState();
}

class _WaterCupProgressState extends State<WaterCupProgress> with TickerProviderStateMixin {
  late AnimationController _fillController;
  late AnimationController _waveController;
  late Animation<double> _fillAnimation;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    // Controller for the main fill animation
    _fillController = AnimationController(duration: widget.animationDuration, vsync: this);

    // Controller for the wave animation (continuous)
    _waveController = AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _fillAnimation = Tween<double>(begin: 0.0, end: widget.progressPercentage).animate(CurvedAnimation(parent: _fillController, curve: widget.curve));

    _waveAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(_waveController);

    // Start animations
    _fillController.forward();
    _waveController.repeat();
  }

  @override
  void didUpdateWidget(WaterCupProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progressPercentage != widget.progressPercentage) {
      _fillAnimation = Tween<double>(
        begin: _fillAnimation.value,
        end: widget.progressPercentage,
      ).animate(CurvedAnimation(parent: _fillController, curve: widget.curve));

      _fillController.reset();
      _fillController.forward();
    }
  }

  @override
  void dispose() {
    _fillController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = widget.size ?? 150.0;

    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Cup outline
          _buildCupOutline(theme, size),

          // Water fill with wave animation
          AnimatedBuilder(
            animation: Listenable.merge([_fillAnimation, _waveAnimation]),
            builder: (context, child) {
              return ClipPath(
                clipper: _CupClipper(),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: CustomPaint(
                    painter: _WaterPainter(fillLevel: _fillAnimation.value, waveOffset: _waveAnimation.value, waterColor: widget.color),
                  ),
                ),
              );
            },
          ),

          // Labels with dynamic colors based on fill level
          AnimatedBuilder(
            animation: _fillAnimation,
            builder: (context, child) {
              final fillLevel = _fillAnimation.value;
              final size = widget.size ?? 150.0;

              // Calculate if labels are over the water area
              final cupHeight = size * 0.8;
              final topY = size * 0.1;
              final bottomY = topY + cupHeight;
              final waterTopY = bottomY - (cupHeight * fillLevel);

              // Determine text colors based on position relative to water level
              final isTopLabelOverWater = waterTopY < (size * 0.3); // Top label area
              final isMiddleLabelOverWater = waterTopY < (size * 0.5); // Middle label area
              final isBottomLabelOverWater = waterTopY < (size * 0.7); // Bottom label area

              // Use white text when over water, original color when not
              final topLabelColor = isTopLabelOverWater ? Colors.white : widget.color;
              final middleLabelColor = isMiddleLabelOverWater ? Colors.white : theme.colorScheme.onSurface;
              final bottomLabelColor = isBottomLabelOverWater ? Colors.white : widget.color;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.topLabel,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: topLabelColor,
                      fontWeight: FontWeight.bold,
                      shadows: isTopLabelOverWater ? [const Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black54)] : null,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    widget.middleLabel,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: middleLabelColor,
                      shadows: isMiddleLabelOverWater ? [const Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black54)] : null,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    widget.bottomLabel,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: bottomLabelColor,
                      fontWeight: FontWeight.w600,
                      shadows: isBottomLabelOverWater ? [const Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black54)] : null,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCupOutline(ThemeData theme, double size) {
    return CustomPaint(size: Size(size, size), painter: _CupOutlinePainter(color: theme.colorScheme.primary.withValues(alpha: 0.15)));
  }
}

class _CupClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    // Create cup shape (wider at top, narrower at bottom)
    final topWidth = width * 0.6;
    final bottomWidth = width * 0.4;
    final cupHeight = height * 0.8;
    final topY = height * 0.1;
    final bottomY = topY + cupHeight;

    // Cup outline
    path.moveTo((width - topWidth) / 2, topY);
    path.lineTo((width - topWidth) / 2 + topWidth, topY);
    path.lineTo((width - bottomWidth) / 2 + bottomWidth, bottomY);
    path.lineTo((width - bottomWidth) / 2, bottomY);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _CupOutlinePainter extends CustomPainter {
  final Color color;

  _CupOutlinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8.0;

    final path = Path();
    final width = size.width;
    final height = size.height;

    final topWidth = width * 0.6;
    final bottomWidth = width * 0.4;
    final cupHeight = height * 0.8;
    final topY = height * 0.1;
    final bottomY = topY + cupHeight;

    // Cup outline
    path.moveTo((width - topWidth) / 2, topY);
    path.lineTo((width - topWidth) / 2 + topWidth, topY);
    path.lineTo((width - bottomWidth) / 2 + bottomWidth, bottomY);
    path.lineTo((width - bottomWidth) / 2, bottomY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _WaterPainter extends CustomPainter {
  final double fillLevel;
  final double waveOffset;
  final Color waterColor;

  _WaterPainter({required this.fillLevel, required this.waveOffset, required this.waterColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (fillLevel <= 0) return;

    final width = size.width;
    final height = size.height;

    final topWidth = width * 0.6;
    final bottomWidth = width * 0.4;
    final cupHeight = height * 0.8;
    final topY = height * 0.1;
    final bottomY = topY + cupHeight;

    // Calculate water level
    final waterTopY = bottomY - (cupHeight * fillLevel);

    // Create water fill path
    final waterPath = Path();

    // Bottom of cup
    waterPath.moveTo((width - bottomWidth) / 2, bottomY);
    waterPath.lineTo((width - bottomWidth) / 2 + bottomWidth, bottomY);

    // Right side of cup (tapered)
    final rightTopX = (width - topWidth) / 2 + topWidth;
    waterPath.lineTo(rightTopX, waterTopY);

    // Wave effect on top
    _drawWave(waterPath, rightTopX, waterTopY, (width - topWidth) / 2, waterTopY, waveOffset);

    // Left side of cup (tapered)
    waterPath.lineTo((width - topWidth) / 2, waterTopY);
    waterPath.lineTo((width - bottomWidth) / 2, bottomY);
    waterPath.close();

    // Create gradient for water
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [waterColor.withValues(alpha: 0.8), waterColor, waterColor.withValues(alpha: 0.9)],
      stops: const [0.0, 0.5, 1.0],
    );

    final rect = Rect.fromLTWH(0, 0, width, height);
    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawPath(waterPath, paint);

    // Add some highlights for realism
    final highlightPaint =
        Paint()
          ..color = Colors.white.withValues(alpha: 0.3)
          ..style = PaintingStyle.fill;

    // Top highlight
    final highlightPath = Path();
    final highlightY = waterTopY + 2;
    highlightPath.moveTo((width - topWidth) / 2 + 10, highlightY);
    highlightPath.lineTo((width - topWidth) / 2 + topWidth - 10, highlightY);
    highlightPath.lineTo((width - topWidth) / 2 + topWidth - 5, highlightY + 3);
    highlightPath.lineTo((width - topWidth) / 2 + 5, highlightY + 3);
    highlightPath.close();

    canvas.drawPath(highlightPath, highlightPaint);
  }

  void _drawWave(Path path, double startX, double startY, double endX, double endY, double waveOffset) {
    const waveCount = 3;
    const waveHeight = 4.0;
    final segmentWidth = (endX - startX) / (waveCount * 2);

    path.moveTo(startX, startY);

    for (int i = 0; i < waveCount; i++) {
      final x2 = startX + (i * 2 + 1) * segmentWidth;
      final x3 = startX + (i * 2 + 2) * segmentWidth;

      final wave1 = startY + math.sin(waveOffset + i * 0.5) * waveHeight;
      final wave2 = startY + math.sin(waveOffset + i * 0.5 + 1) * waveHeight;

      path.quadraticBezierTo(x2, wave1, x3, wave2);
    }
  }

  @override
  bool shouldRepaint(covariant _WaterPainter oldDelegate) {
    return oldDelegate.fillLevel != fillLevel || oldDelegate.waveOffset != waveOffset || oldDelegate.waterColor != waterColor;
  }
}
