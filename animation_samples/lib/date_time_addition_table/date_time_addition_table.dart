import 'package:animation_samples/date_time_addition_table/controller/date_time_addition_table_controller.dart';
import 'package:animation_samples/model/special_hours.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DateTimeAdditionTableScreen extends StatelessWidget {
  const DateTimeAdditionTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DateTimeAdditionTableController>(
      create: (context) => DateTimeAdditionTableController(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('DateTime Addition Table'),
            ),
            body: Consumer<DateTimeAdditionTableController>(
                builder: (context, controller, _) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 172, 172, 172)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Special Hours'),
                                IconButton(
                                    onPressed: () =>
                                        controller.addSpecialHours(),
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ...controller.specialHours.map((specialHours) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: specialHours.isEditable
                                    ? FormDateTimeWidget(
                                        controller: controller,
                                        specialHours: specialHours)
                                    : DisplayNonEditableRows(
                                        controller: controller,
                                        specialHours: specialHours),
                              );
                            }).toList(),
                          ],
                        )),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class DisplayNonEditableRows extends StatelessWidget {
  final SpecialHours specialHours;
  final DateTimeAdditionTableController controller;
  const DisplayNonEditableRows({
    required this.controller,
    required this.specialHours,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(specialHours.fromDate),
        Text(specialHours.toDate),
        Text(specialHours.fromTime),
        Text(specialHours.toTime),
        IconButton(
            onPressed: () {
              controller.makeAllOtherSpecialHoursNotEditable(
                  specialHours); // Implement this method in your controller to handle the editing of the special hours
              controller.makeSpecialHourEditable(
                  specialHours); // Implement this method in your controller to handle the editing of the special hours
            },
            icon: const Icon(Icons.edit)),
        IconButton(
            onPressed: () => controller.removeSpecialHours(specialHours),
            icon: const Icon(Icons.delete)),
      ],
    );
  }
}

class FormDateTimeWidget extends StatelessWidget {
  final DateTimeAdditionTableController controller;
  final SpecialHours specialHours;
  const FormDateTimeWidget({
    required this.controller,
    required this.specialHours,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                value: controller.selectedFromDate == '-'
                    ? specialHours.fromDate
                    : controller
                        .selectedFromDate, // Ensure this is never null when dropdown renders
                hint: const Text('Select Date'),
                onChanged: (newValue) {
                  controller.selectedFromDate = newValue ??
                      DateFormat('dd-MM-yyyy')
                          .format(DateTime.now()); // Default value if null
                },
                items: controller
                    .generateDate()
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: DropdownButton<String>(
                value: controller.selectedToDate == '-'
                    ? specialHours.toDate
                    : controller
                        .selectedToDate, // Ensure this is never null when dropdown renders
                hint: const Text('Select Date'),
                onChanged: (newValue) {
                  controller.selectedToDate = newValue ??
                      DateFormat('yyyy-MM-dd').format(DateTime.now());
                },
                items: controller
                    .generateDate()
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            IconButton(
                onPressed: () {
                  controller.saveSpecialHour(
                      specialHours); // Implement this method in your controller to handle the saving of changes
                },
                icon: const Icon(Icons.save)),
            IconButton(
                onPressed: () => controller.removeSpecialHours(specialHours),
                icon: const Icon(Icons.delete)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DropdownButton<String>(
              value: controller.selectedFromTime == '-'
                  ? specialHours.fromTime
                  : controller.selectedFromTime,
              hint: const Text('Select Time'),
              onChanged: (newValue) {
                controller.selectedFromTime = newValue ?? '';
              },
              items: controller
                  .generateTime()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: controller.selectedToTime == '-'
                  ? specialHours.toTime
                  : controller.selectedToTime,
              hint: const Text('Select Time'),
              onChanged: (newValue) {
                controller.selectedToTime = newValue ?? '';
              },
              items: controller
                  .generateTime()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        )
      ],
    );
  }
}
