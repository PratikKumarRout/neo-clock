import 'dart:math';

import 'package:flutter/material.dart';

class MinuteHand extends StatelessWidget {
  final Size size; // size of the minute hand
  final double minuteAngle; // angle of the minute hand
  const MinuteHand({super.key, required this.size, required this.minuteAngle});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: size, painter: MinuteHnadLine(angle: minuteAngle, theme: Theme.of(context)));
  }
}

class MinuteHnadLine extends CustomPainter {
  final double angle;
  final ThemeData theme;
  MinuteHnadLine({required this.angle, required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    final double clockdiametere = size.width; //diameter of the clock
    final double strokeWidth = clockdiametere * 0.018; //stroke width of the minute hand
    final double lineLength = clockdiametere / 2 - 48; // length of the minute hand

    final Paint paint =
        Paint()
          ..color = theme.colorScheme.secondary // Color of the minute hand
          ..strokeWidth =
              strokeWidth // Stroke width of the minute hand
          ..strokeCap = StrokeCap.round; // Rounded end of the minute hand

    final center = Offset(size.width / 2, size.height / 2); // center of the clock

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
