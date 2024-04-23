import 'package:intl/intl.dart';

mixin DateTimeForm {
//create a for loop that generate time of 15 minutes interval
  List<String> generateTime() {
    List<String> time = [];
    for (int i = 0; i < 24; i++) {
      for (int j = 0; j < 60; j += 15) {
        time.add(
            '${i.toString().padLeft(2, '0')}:${j.toString().padLeft(2, '0')}');
      }
    }
    String closeTime = 'Close';
    time.add(closeTime);
    return time;
  }

  //create a for loop that generate dates with 15 days starting from today
  // Assuming you're using 'yyyy-MM-dd' format in your initial values
  List<String> generateDate() {
    List<String> date = [];
    DateTime today = DateTime.now();
    for (int i = 0; i < 15; i++) {
      DateTime newDate = today.add(Duration(days: i));
      date.add(DateFormat('dd-MM-yyyy')
          .format(newDate)); // Use the same format as in your controller
    }
    return date;
  }
}
