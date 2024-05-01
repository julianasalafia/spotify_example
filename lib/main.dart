import 'package:flutter/material.dart';

import 'core/shared/app_strings.dart';
import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(useMaterial3: true),
      home: Home(),
    );
  }
}
