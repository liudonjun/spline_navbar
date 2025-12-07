import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Painter for the spline-style bottom bar.
/// Draws:
/// - Rounded base bar
/// - Circular notch difference path for the active item
/// - Gradient stroke and soft shadow
class SplineNavbarPainter extends CustomPainter {
  final int itemCount;
  final int selectedIndex;
  final double animatedIndex;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double notchRadius;
  final double depth;
  final double horizontalInset;

  SplineNavbarPainter({
    required this.itemCount,
    required this.selectedIndex,
    required this.animatedIndex,
    required this.backgroundColor,
    required this.borderColor,
    required this.shadowColor,
    required this.notchRadius,
    required this.depth,
    required this.horizontalInset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    // Bar layout metrics
    final cornerRadius = math.min(size.height * 0.40, notchRadius * 1.20);
    final usableWidth = (size.width - horizontalInset * 2).clamp(0, size.width);
    final itemWidth = usableWidth / itemCount;
    final centerX = horizontalInset + itemWidth * (animatedIndex + 0.5);

    const notchLiftFactor = 0.29;
    final smoothDistance = notchRadius * 1;
    final tangentHandle = notchRadius * 0.4;

    final double topY = (size.height * depth) + cornerRadius * 0.18;
    final double arcCenterY =
        (topY + notchRadius * (1 - notchLiftFactor)).clamp(0, size.height);
    final Offset arcStart = Offset(centerX - notchRadius, arcCenterY);
    final Offset arcEnd = Offset(centerX + notchRadius, arcCenterY);

    final Rect baseRect = Rect.fromLTWH(
      0,
      topY,
      size.width,
      size.height - topY,
    );
    final Path base = Path()
      ..addRRect(
        RRect.fromRectAndCorners(
          baseRect,
          topLeft: Radius.circular(cornerRadius),
          topRight: Radius.circular(cornerRadius),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      );

    // Notch cutout path to subtract from the base
    final Path notch = Path()
      ..moveTo(centerX - notchRadius - smoothDistance, topY)
      ..cubicTo(
        centerX - notchRadius - smoothDistance * 0.45,
        topY,
        arcStart.dx,
        arcStart.dy - tangentHandle,
        arcStart.dx,
        arcStart.dy,
      )
      ..arcToPoint(
        arcEnd,
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..cubicTo(
        arcEnd.dx,
        arcEnd.dy - tangentHandle,
        centerX + notchRadius + smoothDistance * 0.45,
        topY,
        centerX + notchRadius + smoothDistance,
        topY,
      )
      ..lineTo(centerX + notchRadius + smoothDistance, topY - notchRadius * 2)
      ..lineTo(centerX - notchRadius - smoothDistance, topY - notchRadius * 2)
      ..close();

    // Final path = base minus notch
    final Path finalPath = Path.combine(PathOperation.difference, base, notch);

    canvas.drawShadow(
      finalPath,
      _withAlpha(shadowColor, 0.55),
      10,
      false,
    );
    canvas.drawPath(finalPath, paint);

    final strokeBounds = finalPath.getBounds();
    final bool activeOnLeft = centerX <= size.width / 2;
    final gradientColors = activeOnLeft
        ? [
            borderColor,
            _withAlpha(borderColor, 0.35),
            _withAlpha(Colors.white, 0.92),
          ]
        : [
            _withAlpha(Colors.white, 0.92),
            _withAlpha(borderColor, 0.35),
            borderColor,
          ];
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: gradientColors,
        stops: const [0.0, 0.55, 1.0],
      ).createShader(strokeBounds);
    canvas.drawPath(finalPath, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Color _withAlpha(Color color, double alpha) {
  // Using withOpacity for widest Flutter compatibility (3.0+).
  // ignore: deprecated_member_use
  return color.withOpacity(alpha);
}
