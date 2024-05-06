import 'package:flutter/material.dart';

class ThemeController extends ValueNotifier<bool> {
  ThemeController(super._value);

  void toggleTheme() {
    value = !value;
  }
}
