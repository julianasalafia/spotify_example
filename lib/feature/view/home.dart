import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/core/shared/app_strings.dart';
import 'package:clone_spotify/core/shared/app_text_styles.dart';
import 'package:clone_spotify/core/shared/theme.dart';
import 'package:clone_spotify/core/widgets/grid.dart';
import 'package:clone_spotify/core/widgets/main_menu.dart';
import 'package:clone_spotify/feature/controller/home_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final HomeController homeController = HomeController();
  final ThemeFlutter themeFlutter = ThemeFlutter();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: themeFlutter,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: themeFlutter.background,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        themeFlutter.toggleTheme();
                      },
                      child: Icon(
                        themeFlutter.darkTheme ? Icons.dark_mode : Icons.light_mode,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  MainMenu(
                    gridController: homeController.gridController,
                  ),
                  const SizedBox(height: 8),
                  Grid(
                    gridController: homeController.gridController,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.forYou,
                        style: AppTextStyles.white24w700,
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: AppColors.mediumGrey,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
