import 'dart:math' as math;

import 'package:flutter/material.dart';

class RoundFace extends StatelessWidget {
  final Size size;

  const RoundFace({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: size, painter: RoundFacePaint(size: size, theme: Theme.of(context)));
  }
}

class RoundFacePaint extends CustomPainter {
  final Size size;
  final ThemeData theme;
  const RoundFacePaint({required this.size, required this.theme});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width * 0.25;
    final double numRadius = size.width * 0.45;
    final double markerRadius = radius * 0.02;
    final double textRadiusFactor = 0.94; // Adjust to position numbers
    final TextStyle textStyle = TextStyle(
      color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
      fontSize: numRadius * 0.15, // Adjust font size relative to the radius
      fontWeight: FontWeight.bold,
    );

    final Paint circlePaint =
        Paint()
          ..color = theme.colorScheme.tertiary
          ..strokeWidth = 0.9
          ..style = PaintingStyle.stroke;

    final Paint markerPaint =
        Paint()
          ..color = theme.colorScheme.inversePrimary
          ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, circlePaint);

    for (int i = 0; i < 12; i++) {
      double angle = 2 * math.pi * i / 12;
      double x = center.dx + (radius * 0.9) * math.cos(angle);
      double y = center.dy + (radius * 0.9) * math.sin(angle);
      canvas.drawCircle(Offset(x, y), markerRadius, markerPaint);
    }

    // Draw hour numbers
    for (var i = 1; i <= 12; i++) {
      double angle = 2 * math.pi * (i % 12) / 12 - math.pi / 2;
      double x = center.dx + (numRadius * textRadiusFactor) * math.cos(angle);
      double y = center.dy + (numRadius * textRadiusFactor) * math.sin(angle);

      final textPainter = TextPainter(
        text: TextSpan(text: i.toString(), style: textStyle),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      final xOffset = x - textPainter.width / 2;
      final yOffset = y - textPainter.height / 2;

      drawPositionedText(canvas, textPainter, Offset(xOffset, yOffset));
    }
  }

  void drawPositionedText(Canvas canvas, textPainter, Offset position) {
    canvas.save();
    canvas.translate(position.dx, position.dy);
    textPainter.paint(canvas, Offset.zero);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
