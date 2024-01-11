import 'package:animation_samples/half_circle_fill_precentege_screen/half_screen_precentege_fill_screen.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier {
  Future<void> navigateToHalfCircleFillPrecentege(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const PrecentegeFillCircle()),
    );
  }
}
