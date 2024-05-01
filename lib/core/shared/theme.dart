import 'package:flutter/material.dart';

class ThemeFlutter with ChangeNotifier {
  bool darkTheme = true;
  Color background = const Color(0xff121212);

  void _applyTheme(bool darkTheme) {
    if (darkTheme) {
      background = const Color(0xff121212);
    } else {
      background = const Color.fromARGB(255, 226, 226, 226);
    }
    notifyListeners();
  }

  void toggleTheme() {
    darkTheme = !darkTheme;
    _applyTheme(darkTheme);
    notifyListeners();
  }
}
