import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MySlidingCards extends StatelessWidget {
  const MySlidingCards({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Card> cards = [
      Card(
        color: _getRandomColor(),
        child: const Center(child: Text('Card 1')),
      ),
      Card(
        color: _getRandomColor(),
        child: const Center(child: Text('Card 2')),
      ),
      Card(
        color: _getRandomColor(),
        child: const Center(child: Text('Card 3')),
      ),
      Card(
        color: _getRandomColor(),
        child: const Center(child: Text('Card 4')),
      ),
      Card(
        color: _getRandomColor(),
        child: const Center(child: Text('Card 5')),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slide cards animation'),
      ),
      body: Flexible(
        child: CardSwiper(
          cardsCount: cards.length,
          backCardOffset: const Offset(40, 40),
          padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 80),
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              cards[index],
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
