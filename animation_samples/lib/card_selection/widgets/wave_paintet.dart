import 'package:flutter/material.dart';
import 'dart:math';

class WavePainter extends CustomPainter {
  final double waveProgress;

  WavePainter(this.waveProgress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(1 - waveProgress) // Fade out effect
      ..style = PaintingStyle.fill;

    final path = Path();
    final startX = size.width;
    final startY = size.height;
    const endX = 0.0;
    const endY = 0.0;

    // Calculate the control point for the quadratic bezier curve
    final controlX = startX - (startX - endX) * 0.1;
    final controlY = startY - (startY - endY) * 0.9;

    // Calculate the radius of the tear drop
    final radius = waveProgress * size.width * 1.5;

    // Move to the starting point (bottom right)
    path.moveTo(startX, startY);

    // Draw the quadratic bezier curve
    path.quadraticBezierTo(controlX, controlY, endX + radius, endY + radius);

    // Draw the arc for the tear drop shape
    path.arcTo(Rect.fromCircle(center: const Offset(endX, endY), radius: radius),
        -pi / 4, pi / 2, false);

    // Close the path
    path.lineTo(startX, startY);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
