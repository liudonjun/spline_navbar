import 'package:flutter/material.dart';

/// Circular badge behind the active icon.
/// Rendered with a fill + stroke and contains the active icon child.
class SplineNavbarBadge extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color strokeColor;
  final Widget child;

  const SplineNavbarBadge({
    super.key,
    required this.size,
    required this.backgroundColor,
    required this.strokeColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _BadgePainter(
              backgroundColor: backgroundColor,
              strokeColor: strokeColor,
            ),
          ),
          SizedBox(
            width: size * 0.45,
            height: size * 0.45,
            child: Center(child: child),
          ),
        ],
      ),
    );
  }
}

class _BadgePainter extends CustomPainter {
  final Color backgroundColor;
  final Color strokeColor;

  _BadgePainter({required this.backgroundColor, required this.strokeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final center = Offset(radius, radius);
    final fill = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, fill);

    final stroke = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    canvas.drawCircle(center, radius - 0.5, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
