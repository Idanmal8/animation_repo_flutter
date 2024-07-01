import 'package:animation_samples/pooping_cards_screen/controller/pooping_cards_controller.dart';
import 'package:animation_samples/pooping_cards_screen/widgets/animated_number_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PoopingCardsScreen extends StatefulWidget {
  const PoopingCardsScreen({super.key});

  @override
  State<PoopingCardsScreen> createState() => _PoopingCardsScreenState();
}

class _PoopingCardsScreenState extends State<PoopingCardsScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -1),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
      reverseCurve: Curves.easeIn,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    _animationController.addStatusListener(_animationStatusListener);
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        if (mounted) {
          _animationController.reverse();
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.removeStatusListener(_animationStatusListener);
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pooping Cards'),
      ),
      body: ChangeNotifierProvider<PoopingCardsController>(
        create: (context) => PoopingCardsController(),
        child: Builder(builder: (context) {
          return Consumer<PoopingCardsController>(
            builder: (context, controller, child) {
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text('-'),
                              ),
                              onTap: () {
                                controller.removeNumber();
                                _animationController.reverse();
                              },
                            ),
                            const SizedBox(width: 36),
                            Text(controller.number.toString()),
                            const SizedBox(width: 36),
                            InkWell(
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text('+'),
                              ),
                              onTap: () {
                                controller.addNumber();
                                _animationController.forward(from: 0);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return AnimatedNumberCard(
                          number: controller.number,
                          slideAnimation: _slideAnimation,
                          scaleAnimation: _scaleAnimation,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
