import 'package:flutter/material.dart';

class LogInOutBorderPaint extends CustomPainter {
  LogInOutBorderPaint();

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    // final rectBorder =
    //     RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(1));
    final rectShadow =
        RRect.fromRectAndRadius(Offset(0, 0) & size, Radius.circular(1));

    final shadowPaint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 10);

    // final borderPaint = Paint()
    //   ..strokeWidth = 3
    //   ..color = Colors.greenAccent
    //   ..style = PaintingStyle.fill;

    canvas.drawRRect(rectShadow, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
