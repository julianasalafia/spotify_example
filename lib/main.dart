import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/core/shared/theme_controller.dart';
import 'package:clone_spotify/feature/view/home.dart';
import 'package:flutter/material.dart';

import 'core/shared/app_strings.dart';
import 'core/shared/custom_theme.dart';

final ThemeController themeController = ThemeController(true);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: themeController,
        builder: (context, value, child) {
          return MaterialApp(
            title: AppStrings.appTitle,
            themeMode: themeController.value ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              useMaterial3: true,
              extensions: const [
                CustomTheme(
                  backgroundColor: AppColors.whiteBackground,
                  textColor: AppColors.deepBlack,
                  cardColor: AppColors.white,
                  selectedColor: AppColors.green,
                ),
              ],
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              extensions: const [
                CustomTheme(
                  backgroundColor: AppColors.deepBlack,
                  textColor: AppColors.white,
                  cardColor: AppColors.softBlack,
                  selectedColor: AppColors.green,
                ),
              ],
            ),
            home: Home(),
          );
        });
  }
}
