import 'package:flutter/material.dart';

class CenterPoint extends StatelessWidget {
  final Size size;
  const CenterPoint({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: size, painter: CenterPointPanter());
  }
}

class CenterPointPanter extends CustomPainter {
  CenterPointPanter();

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width, size.height) / 2;
    final double radius = size.width * 0.02;

    final Paint markCenter =
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius, markCenter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
