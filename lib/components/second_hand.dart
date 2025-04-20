import 'dart:math';
import 'package:flutter/material.dart';

class SecondHand extends StatelessWidget {
  final double angle;
  final Size size; // size of the second hand
  const SecondHand({super.key, required this.size, required this.angle});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: size, painter: SecondHandLine(angle: angle));
  }
}

class SecondHandLine extends CustomPainter {
  final double angle; //angle of the second hand
  SecondHandLine({required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final double clockdiametere = size.width; //diameter of the clock
    final double strokeWidth = clockdiametere * 0.012; //stroke width of the second hand
    final Paint paint =
        Paint()
          ..color = Colors.red // Color of the second hand
          ..strokeWidth =
              strokeWidth // Stroke width of the second hand
          ..strokeCap = StrokeCap.round; // Rounded end of the second hand

    // center of the clock
    final Offset center = Offset(size.width / 2, size.height / 2);

    final lineLength = clockdiametere / 2 - 25; // length of the line

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
