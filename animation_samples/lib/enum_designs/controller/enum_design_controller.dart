import 'package:flutter/material.dart';

class InformationEnumPageController extends ChangeNotifier{

  final Map<dynamic,dynamic> _information = {
    'information1': 'This is information 1',
    'information2': 'This is information 2',
    'information3': 'This is information 3',
    'information4': 'This is information 4',
    'information5': 'This is information 5',
    'information_list' : [
      {
        'title': 'Information 1',
        'description': 'This is information 1'
      },
      {
        'title': 'Information 2',
        'description': 'This is information 2'
      },
      {
        'title': 'Information 3',
        'description': 'This is information 3'
      },
      {
        'title': 'Information 4',
        'description': 'This is information 4'
      },
      {
        'title': 'Information 5',
        'description': 'This is information 5'
      }
    ],
    'information_list_2' : [
      {
        'title': 'Information2 1',
        'description': 'This is information 1'
      },
      {
        'title': 'Information2 2',
        'description': 'This is information 2'
      },
      {
        'title': 'Information2 3',
        'description': 'This is information 3'
      },
      {
        'title': 'Information2 4',
        'description': 'This is information 4'
      },
      {
        'title': 'Information2 5',
        'description': 'This is information 5'
      }
    ]
  }; 

  Map<dynamic,dynamic> get information => _information;

}