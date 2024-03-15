import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ContactCardPainter extends CustomPainter {
  const ContactCardPainter({required this.vertex, this.thickness = 15});

  final double vertex;
  final double thickness;

  @override
  void paint(Canvas canvas, Size size) {
    Paint topPaint = Paint()
    ..color = Colors.white
      ..style = PaintingStyle.fill
      ..shader = const RadialGradient(
        // Offset.zero,
        // vertex,
        // [
        //   const Color(0xFF56ab2f),
        //   const Color(0xFFa8e063),
        // ],
        // [0.42, 1.0],
        colors: [Color(0xFF56ab2f), Color(0xFFa8e063)],
        stops: [0.42, 1.0],
      ).createShader(Rect.fromCircle(center: Offset.zero, radius: vertex));

    Paint bottomPaint = Paint()
      ..style = PaintingStyle.fill
      ..invertColors = false
      ..shader = ui.Gradient.radial(
        Offset(size.width, size.height),
        vertex,
        [
          const Color(0xFF56ab2f),
          const Color(0xFFa8e063),
        ],
        [0.42, 1.0],
      );

    canvas.drawPath(cardTopLeftLinePath(size.width, size.height), topPaint);
    canvas.drawPath(cardBottomRightLinePath(size.width, size.height), bottomPaint);
  }

  Path cardTopLeftLinePath(double x, double y) {
    return Path()
      ..moveTo(16, 0)
      ..lineTo(vertex, 0)
      ..lineTo(vertex - thickness, thickness)
      ..lineTo(thickness + 6, thickness)
      ..conicTo(thickness, thickness, thickness, thickness + 6, 1.6)
      ..lineTo(thickness, vertex - thickness)
      ..lineTo(0, vertex)
      ..lineTo(0, 16)
      ..conicTo(0, 0, 16, 0, 1.6);
  }

  Path cardBottomRightLinePath(double x, double y) {
    return Path()
      ..moveTo(x - 16, y)
      ..lineTo((x - vertex), y)
      ..lineTo((x - vertex) + thickness, y - thickness)
      ..lineTo((x - thickness) - 6, y - thickness)
      ..conicTo(x - thickness, y - thickness, x - thickness, y - thickness - 6, 1.6)
      ..lineTo(x - thickness, (y - vertex) + thickness)
      ..lineTo(x, y - vertex)
      ..lineTo(x, y - 16)
      ..conicTo(x, y, x - 16, y, 1.6);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
