import 'package:animation_samples/date_time_addition_table/date_time_addition_table.dart';
import 'package:animation_samples/enum_designs/enum_design.dart';
import 'package:animation_samples/half_circle_fill_precentege_screen/half_screen_precentege_fill_screen.dart';
import 'package:animation_samples/pooping_cards_screen/pooping_cards_screen.dart';
import 'package:animation_samples/rotating_time/rotating_time.dart';
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
          builder: (context) => const MySlidingCards()),
    );
  }
  Future<void> navigateEnumDesignsScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const EnumDesigns()),
    );
  }
  Future<void> navigateDateTimeTableScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const DateTimeAdditionTableScreen()),
    );
  }
  Future<void> navigateToPoopingCardsScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const PoopingCardsScreen()),
    );
  }
  Future<void> navigateToRotatingTimeScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const RotatingTime()),
    );
  }
}
