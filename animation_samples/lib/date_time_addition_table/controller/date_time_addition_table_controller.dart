import 'package:animation_samples/date_time_addition_table/util/date_time_mixin.dart';
import 'package:animation_samples/model/special_hours.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateTimeAdditionTableController extends ChangeNotifier with DateTimeForm {
  final List<SpecialHours> _specialHours = [];
  int _incrementId = 0;
  bool _isLoading = false;
  String _selectedFromDate = '-';
  String _selectedToDate = '-';
  String _selectedFromTime = '-';
  String _selectedToTime = '-';

  bool get isLoading => _isLoading;
  List<SpecialHours> get specialHours => _specialHours;
  String get selectedFromDate => _selectedFromDate;
  String get selectedToDate => _selectedToDate;
  String get selectedFromTime => _selectedFromTime;
  String get selectedToTime => _selectedToTime;

  set selectedFromDate(String value) {
    _selectedFromDate = value;
    notifyListeners();
  }

  set selectedToDate(String value) {
    _selectedToDate = value;
    notifyListeners();
  }

  set selectedFromTime(String value) {
    _selectedFromTime = value;
    notifyListeners();
  }

  set selectedToTime(String value) {
    _selectedToTime = value;
    notifyListeners();
  }

  void addSpecialHours() {
    _isLoading = true;
    notifyListeners();

    SpecialHours newSpecialHours = SpecialHours(
      id: _incrementId++,
      fromDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
      toDate: DateFormat('dd-MM-yyyy').format(DateTime.now()
          .add(const Duration(days: 1))), // Example of adding a day
      fromTime: '09:00', // Placeholder for actual time logic
      toTime: '17:00', // Placeholder for actual time logic
      isEditable: true,
    );
    _specialHours.add(newSpecialHours);

    _isLoading = false;
    notifyListeners();
  }

  void removeSpecialHours(SpecialHours specialHours) {
    _isLoading = true;
    notifyListeners();

    _specialHours.remove(specialHours);

    _isLoading = false;
    notifyListeners();
  }

  void makeSpecialHourEditable(SpecialHours specialHours) {
    _isLoading = true;
    notifyListeners();

    specialHours.isEditable = true;

    _isLoading = false;
    notifyListeners();
  }

  void saveSpecialHour(SpecialHours specialHours) {
    _isLoading = true;
    notifyListeners();

    specialHours.fromDate = _selectedFromDate == '-' ? specialHours.fromDate : _selectedFromDate;
    specialHours.toDate = _selectedToDate == '-' ? specialHours.toDate : _selectedToDate;
    specialHours.fromTime = _selectedFromTime == '-' ? specialHours.fromTime : _selectedFromTime;
    specialHours.toTime = _selectedToTime == '-' ? specialHours.toTime : _selectedToTime;
    specialHours.isEditable = false;

    resetSpecialHourVariables();

    _isLoading = false;
    notifyListeners();
  }

  void resetSpecialHourVariables() {
    _isLoading = true;
    notifyListeners();

    _selectedFromDate = '-';
    _selectedToDate = '-';
    _selectedFromTime = '-';
    _selectedToTime = '-';

    _isLoading = false;
    notifyListeners();
  }

  void makeAllOtherSpecialHoursNotEditable(SpecialHours specialHours) {
    _isLoading = true;
    notifyListeners();

    for (SpecialHours sh in _specialHours) {
      if (sh.id != specialHours.id) {
        sh.isEditable = false;
      }
    }

    _isLoading = false;
    notifyListeners();
  }
}
