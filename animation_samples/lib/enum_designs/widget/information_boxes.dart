import 'package:animation_samples/enum_designs/enum/information_design_enum.dart';
import 'package:flutter/material.dart';

class InformationBoxes extends StatelessWidget {
  final InformationDesignEnum boxEnum;
  final Map<dynamic, dynamic> information;
  final String? title;
  final Icon? icon;

  const InformationBoxes({
    required this.boxEnum,
    required this.information,
    this.title,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;

    switch (boxEnum) {
      case InformationDesignEnum.withoutTitleWithIconNoSpace:
        content = containerWithoutTitleWithIconNoSpace(
            context, information, icon?.icon ?? Icons.info);
        break;
      case InformationDesignEnum.withTitleNoSpace:
        content = containerWithTitleNoSpace(context, information, title ?? '');
        break;
      case InformationDesignEnum.withTitleWithIconNoSpace:
        content = containerWithTitleWithIconNoSpace(
            context, information, title ?? '', icon?.icon ?? Icons.info);
        break;
      case InformationDesignEnum.withTitleWithIconNoSpaceWithToggle:
        content = containerWithTitleWithIconNoSpaceWithToggle(
            context, information, title ?? '', icon?.icon ?? Icons.info);
        break;
      case InformationDesignEnum.withTitleWithSpace:
        content =
            containerWithTitleWithSpace(context, information, title ?? '');
        break;
      default:
        content = const Placeholder();
        break;
    }

    return Scaffold(
      body: content,
    );
  }

  Widget containerWithoutTitleWithIconNoSpace(
      BuildContext context, Map<dynamic, dynamic> information, IconData icon) {
    List<Widget> children = information.entries.map<Widget>((entry) {
      if (entry.value is String) {
        return Row(
          children: [
            Icon(icon), // Wrap the icon variable with the Icon widget
            const SizedBox(width: 5),
            Text(entry.key),
            const SizedBox(width: 10),
            Text(entry.value),
          ],
        );
      }
      return const SizedBox.shrink();
    }).toList();

    return SingleChildScrollView(
      child: SizedBox(
        child: Column(children: children),
      ),
    );
  }

  Widget containerWithTitleNoSpace(
      BuildContext context, Map<dynamic, dynamic> information, String title) {
    List<Widget> children = [];

     // Iterate over each entry in the information map
    information.forEach((key, value) {
      if (value is String) {
        // Add a row with the information
        children.add(Row(
          children: [
            Text(key.toString()),
            const SizedBox(width: 5),
            Expanded(child: Text(value)), // Ensure text doesn't overflow
          ],
        ));
        // Add a divider after each row except the last one
        children.add(const Divider());
      }
    });

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity, // Ensures the SizedBox fills its parent's width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
            const Divider(),
            ...children, // Spread the list of children into the column
          ],
        ),
      ),
    );
  }

  Widget containerWithTitleWithIconNoSpace(BuildContext context,
      Map<dynamic, dynamic> information, String title, IconData icon) {
    // Create a new list to hold the rows and dividers
    List<Widget> children = [];

    // Iterate over each entry in the information map
    information.forEach((key, value) {
      if (value is String) {
        // Add a row with the information
        children.add(Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(key.toString()),
            const SizedBox(width: 5),
            Expanded(child: Text(value)), // Ensure text doesn't overflow
          ],
        ));
        // Add a divider after each row except the last one
        children.add(const Divider());
      }
    });

    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity, // Ensures the SizedBox fills its parent's width
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title),
            ),
            const Divider(),
            ...children, // Spread the list of children into the column
          ],
        ),
      ),
    );
  }

  Widget containerWithTitleWithIconNoSpaceWithToggle(BuildContext context,
      Map<dynamic, dynamic> information, String title, IconData icon) {
    List<Widget> children = information.entries.map<Widget>((entry) {
      if (entry.value is String) {
        return Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            Text(entry.key.toString()),
            const SizedBox(width: 5),
            Text(entry.value),
          ],
        );
      }
      return const SizedBox.shrink();
    }).toList();

    return SizedBox(
      child: SingleChildScrollView(
        child: Column(children: [
          Text(information['title'] ?? ''),
          const Divider(),
          Column(
            children: children,
          ),
        ]),
      ),
    );
  }

  Widget containerWithTitleWithSpace(
      BuildContext context, Map<dynamic, dynamic> information, String title) {
    List<Widget> children = information.entries.map<Widget>((entry) {
      if (entry.value is String) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(entry.key.toString()),
            Text(entry.value),
          ],
        );
      }
      return const SizedBox.shrink();
    }).toList();

    return SingleChildScrollView(
      child: SizedBox(
        child: Column(children: [
          Text(information['title'] ?? ''),
          const Divider(),
          Column(
            children: children,
          ),
        ]),
      ),
    );
  }
}
