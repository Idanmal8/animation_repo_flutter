import 'package:flutter/material.dart';

class AnimatedNumberCard extends StatelessWidget {
  final int number;
  final Animation<Offset> slideAnimation;
  final Animation<double> scaleAnimation;

  const AnimatedNumberCard({
    Key? key,
    required this.number,
    required this.slideAnimation,
    required this.scaleAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              number.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
