import 'dart:math';
import 'package:flutter/material.dart';

class HourHand extends StatelessWidget {
  final Size size; // size of the hour hand
  final double hourAngle; // angle of the hour hand
  const HourHand({super.key, required this.size, required this.hourAngle});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: HourHandPainter(angle: hourAngle, theme: Theme.of(context)), // Custom painter for the hour hand
    );
  }
}

class HourHandPainter extends CustomPainter {
  final double angle; // angle of the hour hand
  final ThemeData theme;
  HourHandPainter({required this.angle, required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    //diameter of the clock
    final double clockDiameter = size.width;

    //stroke width of the hour hand
    final double strokeWidth = clockDiameter * 0.023;

    //length of the hour hand
    final double lineLength = clockDiameter / 2 - 75;

    // Create a paint object for the hour hand
    final Paint paint =
        Paint()
          ..color = theme.colorScheme.secondary
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    //center of the clock
    final center = Offset(size.width / 2, size.height / 2);

    // calculate the end point of the line
    final endPoint = Offset(
      center.dx + lineLength * cos(angle - pi / 2),
      center.dy + lineLength * sin(angle - pi / 2),
    );

    // draw the line
    canvas.drawLine(center, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // No need to repaint since the line is static
  }
}
