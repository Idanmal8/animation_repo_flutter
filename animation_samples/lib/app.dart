import 'package:animation_samples/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenController(),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Animation Samples',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            cardTheme: const CardTheme(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Animation Samples'),
            ),
            body: Consumer<HomeScreenController>(
                builder: (context, controller, child) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: ListTile(
                        title: const Text('Half Circle Fill Precentege'),
                        onTap: () => controller
                            .navigateToHalfCircleFillPrecentege(context),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Scale Square Animation'),
                        onTap: () =>
                            controller.navigateToScaleSquareAnimation(context),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Slide cards animation'),
                        onTap: () =>
                            controller.navigateToSlideAnywhereCards(context),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('various designs with enum'),
                        onTap: () => {
                          controller.navigateEnumDesignsScreen(context),
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('date time table'),
                        onTap: () => {
                          controller.navigateDateTimeTableScreen(context),
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Pooping cards'),
                        onTap: () => {
                          controller.navigateToPoopingCardsScreen(context),
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Rotating Time'),
                        onTap: () => {
                          controller.navigateToRotatingTimeScreen(context),
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Select users stack'),
                        onTap: () => {
                          controller.navigateToSelectStackScreen(context),
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text('Select card'),
                        onTap: () => {
                          controller.navigateToSelectCards(context),
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
