import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardSelection extends StatefulWidget {
  const CardSelection({super.key});

  @override
  CardSelectionState createState() => CardSelectionState();
}

class CardSelectionState extends State<CardSelection>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _waveController;
  late Animation<double> _waveAnimation;

  bool _isShimmering = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = TweenSequence(
      [
        TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 0.95)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 0.95, end: 1.05)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(begin: 1.05, end: 1.0)
              .chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        ),
      ],
    ).animate(_scaleController);

    _waveController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _waveAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _waveController,
      curve: Curves.easeInOut,
    ));
  }

  void _bounce() {
    _scaleController.forward(from: 0);
    _waveController.forward(from: 0);
    setState(() {
      _isShimmering = true;
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        _isShimmering = false;
      });
    });
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Selection'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _bounce,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  width: 400,
                  height: 310,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Container(
                              color: const Color.fromARGB(255, 239, 239, 239),
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Image.asset(
                                      'assets/beer.png',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  if (_isShimmering)
                                    Shimmer.fromColors(
                                      period: const Duration(milliseconds: 800), // Faster shimmer duration
                                      baseColor: Colors.white.withOpacity(0), // More opaque base color
                                      highlightColor: Colors.white.withOpacity(0.4), // More opaque highlight color
                                      child: Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Colors.white,
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'JLM drinks',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text('Cafe'),
                                        ],
                                      ),
                                    ),
                                    Card(
                                      elevation: 0,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '30-40',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'min',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.directions_bike),
                                      SizedBox(width: 8),
                                      Text('10.00₪'),
                                      SizedBox(width: 8),
                                      Text('₪₪₪₪'),
                                      SizedBox(width: 8),
                                      Text('☺️9.6')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
