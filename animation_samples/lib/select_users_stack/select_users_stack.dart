import 'package:flutter/material.dart';

class SelectUsersStack extends StatefulWidget {
  final double size;

  const SelectUsersStack({super.key, this.size = 100});

  @override
  SelectUsersStackState createState() => SelectUsersStackState();
}

class SelectUsersStackState extends State<SelectUsersStack> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  void toggleAnimation() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.reverse();
    } else if (_controller.status == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double smallCircleSize = widget.size * 0.5;
    final double smallerCircleSize = widget.size * 0.43;
    final double offset1 = widget.size * 0.05;
    final double offset2 = widget.size * 0.085;
    final double offset3 = widget.size * 0.015;

    return Center(
      child: GestureDetector(
        onTap: toggleAnimation,
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            children: [
              Container(
                width: widget.size,
                height: widget.size,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                child: const Icon(Icons.person),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Transform.translate(
                          offset: Offset(offset1, offset1),
                          child: Transform.scale(
                            scale: _animation.value,
                            child: Container(
                              width: smallCircleSize,
                              height: smallCircleSize,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Transform.translate(
                          offset: Offset(offset2, offset3),
                          child: Transform.scale(
                            scale: _animation.value,
                            child: Container(
                              width: smallerCircleSize,
                              height: smallerCircleSize,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16, // Adjusted to fit smaller size
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}