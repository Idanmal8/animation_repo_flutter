import 'package:flutter/material.dart';
import 'dart:math';

class CardObject extends StatelessWidget {
  final String cardId;

  const CardObject({
    required this.cardId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _getRandomColor(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Center(
          child: Text(
            cardId,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(200),
      Random().nextInt(200),
      Random().nextInt(200),
    );
  }
}
