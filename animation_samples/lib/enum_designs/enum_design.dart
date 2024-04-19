import 'package:animation_samples/enum_designs/controller/enum_design_controller.dart';
import 'package:animation_samples/enum_designs/enum/information_design_enum.dart';
import 'package:animation_samples/enum_designs/widget/information_boxes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnumDesigns extends StatelessWidget {
  const EnumDesigns({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InformationEnumPageController>(
        create: (context) => InformationEnumPageController(),
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Various designs with enum'),
            ),
            body: Consumer<InformationEnumPageController>(
              builder: (context, controller, child) {
                return Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: InformationBoxes(
                            boxEnum: InformationDesignEnum.withTitleNoSpace,
                            information: controller.information,
                            title: 'Header 2'),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: InformationBoxes(
                            boxEnum:
                                InformationDesignEnum.withTitleWithIconNoSpace,
                            icon: const Icon(Icons.dangerous),
                            information: controller.information,
                            title: 'Header 3'),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: InformationBoxes(
                            boxEnum: InformationDesignEnum
                                .withTitleWithIconNoSpaceWithToggle,
                            icon: const Icon(Icons.abc_outlined),
                            information: controller.information,
                            title: 'Header 1'),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: InformationBoxes(
                            boxEnum: InformationDesignEnum.withTitleWithSpace,
                            information: controller.information,
                            title: 'Header 3'),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: InformationBoxes(
                          boxEnum:
                              InformationDesignEnum.withoutTitleWithIconNoSpace,
                          icon: const Icon(Icons.kayaking),
                          information: controller.information,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          );
        }));
  }
}
