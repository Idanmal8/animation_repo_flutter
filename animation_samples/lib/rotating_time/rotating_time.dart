import 'package:flutter/material.dart';

class RotatingTime extends StatefulWidget {
  const RotatingTime({super.key});

  @override
  RotatingTimeState createState() => RotatingTimeState();
}

class RotatingTimeState extends State<RotatingTime>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration:
          const Duration(seconds: 3), // Set the duration for a full rotation
      vsync: this,
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotating Time'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const SizedBox(
              width: 100, // Set the desired width
              height: 100, // Set the desired height
              child: CircularProgressIndicator(
                color: Colors.grey,
                value: 1, // Set the desired value
                strokeCap: StrokeCap.round, // Optional: Adjust the stroke cap
                strokeWidth: 7, // Optional: Adjust the thickness of the circle
              ),
            ),
            RotationTransition(
              turns: _controller,
              child: const SizedBox(
                width: 100, // Set the desired width
                height: 100, // Set the desired height
                child: CircularProgressIndicator(
                  value: 0.5, // Set the desired value
                  strokeCap: StrokeCap.round, // Optional: Adjust the stroke cap
                  strokeWidth:
                      6, // Optional: Adjust the thickness of the circle
                ),
              ),
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('20-30'), Text('Minutes')],
            ),
          ],
        ),
      ),
    );
  }
}
