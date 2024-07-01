import 'package:flutter/material.dart';

class PoopingCardsController extends ChangeNotifier{
  int _number = 0;
  int get number => _number;

  void addNumber(){
    _number++;
    notifyListeners();
  }

  void removeNumber(){
    if(_number == 0) return;
    _number--;
    notifyListeners();
  }
}