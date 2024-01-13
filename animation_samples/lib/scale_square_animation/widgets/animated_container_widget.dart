import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onTap;
  final int index;

  const AnimatedContainerWidget({
    required this.animation,
    required this.onTap,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          double scale = 1.0 + animation.value;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            width: 100 * scale, // Width changes based on animation
            height: 100 * scale, // Height changes based on animation
            decoration: BoxDecoration(
              color: animation.value == 1.0 ? Colors.blue : Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                ),
              ],
            ),
            child: Center(child: Text(animation.value == 1.0 ? '$index' : 'Scaled')),
          );
        },
      ),
    );
  }
}
