import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_park/values/colors.dart';

const double _ringWidth = 4.0;

class GradientArc extends CustomPainter {
  final Gradient _gradient = LinearGradient(colors: [
    ColorRes.BUTTON_START_COLOR,
    ColorRes.BUTTON_MIDDLE_COLOR,
    ColorRes.BUTTON_END_COLOR,
  ]);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.width * 0.5;
    final Offset offsetCenter = Offset(center, center);
    // 开始的弧度
    final startAngle = _degToRad(155.0);
    // 结束的弧度
    final endAngle = _degToRad(230.0);
    // 圆弧所在圆的 Rect
    final Rect arcRect = Rect.fromCircle(
        center: offsetCenter, radius: center - _ringWidth * 0.2);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = _ringWidth
      ..shader = _gradient.createShader(arcRect);
    canvas.drawArc(arcRect, startAngle, endAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  num _degToRad(num deg) => deg * (pi / 180);
}
