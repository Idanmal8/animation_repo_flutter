import 'package:animation_samples/half_circle_fill_precentege_screen/half_screen_precentege_fill_screen.dart';
import 'package:animation_samples/scale_square_animation/scale_square_animation_screen.dart';
import 'package:animation_samples/sliding_anywhere_pattern/sliding_squares.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  Future<void> navigateToHalfCircleFillPrecentege(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const PrecentegeFillCircle()),
    );
  }

  Future<void> navigateToScaleSquareAnimation(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const ScaleSquareAnimationScreen()),
    );
  }
  Future<void> navigateToSlideAnywhereCards(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => MySlidingCards()),
    );
  }
}
