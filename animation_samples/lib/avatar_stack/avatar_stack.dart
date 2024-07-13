import 'package:animation_samples/avatar_stack/controller/avatar_stack_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarStack extends StatefulWidget {
  const AvatarStack({super.key});

  @override
  AvatarStackState createState() => AvatarStackState();
}

class AvatarStackState extends State<AvatarStack> with TickerProviderStateMixin {
  final List<AnimationController> _animationControllers = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 4; i++) {
      _animationControllers.add(AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ));
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimations();
    });
  }

  void _startAnimations() {
    for (int i = 0; i < _animationControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        _animationControllers[i].forward();
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Stack'),
      ),
      body: ChangeNotifierProvider<AvatarStackController>(
        create: (context) => AvatarStackController(),
        child: Builder(builder: (context) {
          return Consumer<AvatarStackController>(
              builder: (context, controller, _) {
            return Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(controller.selectedAvatar),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: List.generate(controller.avatars.length,
                              (index) {
                            var animation = Tween<Offset>(
                              begin: const Offset(-1.5, 0.0),
                              end: Offset(index * 30.0 / 100, 0.0),
                            ).animate(CurvedAnimation(
                              parent: _animationControllers[index],
                              curve: Curves.easeInOut,
                            ));

                            return AnimatedBuilder(
                              animation: _animationControllers[index],
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: animation.value * 100,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.selectedAvatar =
                                          controller.avatars[index];
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            controller.avatars[index]),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
        }),
      ),
    );
  }
}