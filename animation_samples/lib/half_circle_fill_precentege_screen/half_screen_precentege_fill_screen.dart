import 'package:flutter/material.dart';
import 'dart:math' as math;

class PrecentegeFillCircle extends StatefulWidget {
  const PrecentegeFillCircle({super.key});

  @override
  State<PrecentegeFillCircle> createState() => _PrecentegeFillCircleState();
}

class _PrecentegeFillCircleState extends State<PrecentegeFillCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  final double progress = 0.9;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut, // Using an ease-in-out curve
    );

    animation =
        Tween<double>(begin: 0.0, end: progress).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Half Circle Fill Percentage'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 200, // Height of the container
              width: 350, // Width of the container
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 195, 255, 91),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 30,
              child: CustomPaint(
                painter: ArcPaint(progress: animation.value),
                size: const Size(290, 290), // Adjusted to fit as a half-circle
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArcPaint extends CustomPainter {
  final double progress;

  ArcPaint({this.progress = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - 10;

    final circlePinPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final paint = Paint()
      ..color = const Color.fromARGB(255, 215, 103, 255)
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final backgroundPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..strokeWidth = 30
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Draw the background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      backgroundPaint,
    );

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi * progress,
      false,
      paint,
    );

    // Calculate the position of the circle along the arc
    final angle = math.pi + (math.pi * progress);
    final circlePosition = Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );

    // Draw the black circle at the calculated position
    canvas.drawCircle(circlePosition, 18, circlePinPaint);

    // Draw an icon in the center of the circle
    final textSpan = TextSpan(
      text: String.fromCharCode(Icons.ac_unit_outlined.codePoint),
      style: TextStyle(
        fontSize: 30,
        fontFamily: Icons.payment.fontFamily,
        color: Colors.white,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final offset = Offset(
      circlePosition.dx - (textPainter.width / 2),
      circlePosition.dy - (textPainter.height / 2),
    );

    textPainter.paint(canvas, offset); // Adjust the radius as needed
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
