import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isLightTheme = true;

  void changeTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme =>
      _isLightTheme ? ThemeData.light() : ThemeData.dark();
}
