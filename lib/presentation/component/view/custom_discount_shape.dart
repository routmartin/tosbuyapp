import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomDiscountShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2500000);
    path_0.cubicTo(
      0,
      size.height * 0.1119287,
      size.width * 0.04477150,
      0,
      size.width * 0.1000000,
      0,
    );
    path_0.lineTo(size.width * 0.7881750, 0);
    path_0.cubicTo(
      size.width * 0.8177875,
      0,
      size.width * 0.8458775,
      size.height * 0.03280981,
      size.width * 0.8648775,
      size.height * 0.08959125,
    );
    path_0.lineTo(size.width * 0.9919350, size.height * 0.4693062);
    path_0.cubicTo(
      size.width * 0.9971450,
      size.height * 0.4848769,
      size.width,
      size.height * 0.5045306,
      size.width,
      size.height * 0.5248306,
    );
    path_0.cubicTo(
      size.width,
      size.height * 0.5467919,
      size.width * 0.9966600,
      size.height * 0.5679312,
      size.width * 0.9906575,
      size.height * 0.5839650,
    );
    path_0.lineTo(size.width * 0.8645350, size.height * 0.9208375);
    path_0.cubicTo(
      size.width * 0.8456275,
      size.height * 0.9713375,
      size.width * 0.8191950,
      size.height,
      size.width * 0.7915275,
      size.height,
    );
    path_0.lineTo(size.width * 0.1000000, size.height);
    path_0.cubicTo(size.width * 0.04477150, size.height, 0,
        size.height * 0.8880687, 0, size.height * 0.7500000);
    path_0.lineTo(0, size.height * 0.2500000);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
      Offset(size.width * -7.450575e-7, size.height * 0.5000000),
      Offset(size.width, size.height * 0.5000000),
      [
        const Color(0xffE54A81).withOpacity(1),
        const Color(0xffF48221).withOpacity(1),
      ],
      [
        0,
        1,
      ],
    );
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
