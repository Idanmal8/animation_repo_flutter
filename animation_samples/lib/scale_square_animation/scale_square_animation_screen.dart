import 'package:flutter/material.dart';
import 'package:animation_samples/scale_square_animation/widgets/animated_container_widget.dart';

class ScaleSquareAnimationScreen extends StatefulWidget {
  const ScaleSquareAnimationScreen({Key? key}) : super(key: key);

  @override
  State<ScaleSquareAnimationScreen> createState() =>
      _ScaleSquareAnimationScreenState();
}

class _ScaleSquareAnimationScreenState extends State<ScaleSquareAnimationScreen>
    with TickerProviderStateMixin {
  final int numberOfContainers = 10;
  late List<AnimationController> controllers;
  late List<Animation<double>> scaleAnimations;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(
      numberOfContainers,
      (_) => AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ),
    );

    scaleAnimations = controllers.map((controller) {
      return CurvedAnimation(
        parent: controller,
        curve: Curves.fastLinearToSlowEaseIn, // Can change to whatever animation you want
      ).drive(Tween<double>(begin: 1.0, end: 2.0)); // Adjusted for ease-in-out animation
    }).toList();
  }

  void _onTap(int tappedIndex) {
    if (controllers[tappedIndex].isCompleted) {
      controllers[tappedIndex].reverse();
    } else {
      controllers[tappedIndex].forward();
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scale Square Animation'),
      ),
      body: Center(
        child: SizedBox(
          height: 150, // Adjusted for vertical scaling
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numberOfContainers,
            itemBuilder: (context, index) {
              return AnimatedContainerWidget(
                animation: scaleAnimations[index],
                onTap: () => _onTap(index),
                index: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
