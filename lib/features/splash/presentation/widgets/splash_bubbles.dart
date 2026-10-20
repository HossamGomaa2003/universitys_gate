import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';

class SplashBubbles extends StatelessWidget {
  const SplashBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPaint(
      painter: _BubblesPainter(),
      child: SizedBox.expand(),
    );
  }
}

class _BubblesPainter extends CustomPainter {
  const _BubblesPainter();

  // Five static bubbles
  static const List<_Bubble> _bubbles = [
    _Bubble(
      x: 0.12,
      y: 0.18,
      radius: 38,
    ),
    _Bubble(
      x: 0.87,
      y: 0.22,
      radius: 26,
    ),
    _Bubble(
      x: 0.91,
      y: 0.55,
      radius: 45,
    ),
    _Bubble(
      x: 0.14,
      y: 0.72,
      radius: 30,
    ),
    _Bubble(
      x: 0.72,
      y: 0.86,
      radius: 20,
    ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    // Transparent fill without borders
    final Paint fillPaint = Paint()
      ..color = AppColors.secondary.withValues(
        alpha: 0.08,
      )
      ..style = PaintingStyle.fill;

    for (final bubble in _bubbles) {
      final Offset center = Offset(
        size.width * bubble.x,
        size.height * bubble.y,
      );

      canvas.drawCircle(
        center,
        bubble.radius,
        fillPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BubblesPainter oldDelegate) {
    return false;
  }
}

// Bubble model
class _Bubble {
  final double x;
  final double y;
  final double radius;

  const _Bubble({
    required this.x,
    required this.y,
    required this.radius,
  });
}