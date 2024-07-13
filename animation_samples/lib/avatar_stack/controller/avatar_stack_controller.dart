import 'package:flutter/material.dart';

class AvatarStackController extends ChangeNotifier {
  final List<String> _allAvatars = [
    'assets/ai_image.jpg',
    'assets/another_person.jpg',
    'assets/beer.png',
    'assets/not_cool.jpg',
  ];

  final List<String> _avatars = [
    'assets/another_person.jpg',
    'assets/beer.png',
    'assets/not_cool.jpg',
  ];

  String _selectedAvatar = 'assets/ai_image.jpg';

  List<String> get avatars => _avatars;
  String get selectedAvatar => _selectedAvatar;

  set selectedAvatar(String avatar) {
    if (_selectedAvatar != avatar) {
      _avatars.add(_selectedAvatar);
      _avatars.remove(avatar);
      _selectedAvatar = avatar;
      notifyListeners();
    }
  }

  void changeSelectedAvatar(String avatar) {
    _avatars.add(_selectedAvatar);
    _avatars.remove(avatar);
    _selectedAvatar = avatar;
    notifyListeners();
  }
}