import 'package:flutter/material.dart';

class AppDrawerState extends ChangeNotifier {
  String _selectedTileName = 'Home';

  String get selectedTileName => _selectedTileName;

  set setTileName(String name) {
    if (name != null) {
      _selectedTileName = name;
      notifyListeners();
    }
  }
}