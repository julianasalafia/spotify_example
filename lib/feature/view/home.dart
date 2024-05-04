import 'package:clone_spotify/core/shared/theme.dart';
import 'package:clone_spotify/core/widgets/for_you.dart';
import 'package:clone_spotify/core/widgets/grid.dart';
import 'package:clone_spotify/core/widgets/main_menu.dart';
import 'package:clone_spotify/core/widgets/new_app_bar.dart';
import 'package:clone_spotify/feature/controller/grid_controller.dart';
import 'package:clone_spotify/feature/controller/home_controller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final HomeController homeController = HomeController(
    gridController: GridController(),
    themeFlutter: ThemeFlutter(),
  );

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: homeController.themeFlutter,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: homeController.themeFlutter.background,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  NewAppBar(
                    themeFlutter: homeController.themeFlutter,
                    onPressed: () => homeController.themeFlutter.toggleTheme(),
                  ),
                  MainMenu(gridController: homeController.gridController),
                  Grid(gridController: homeController.gridController),
                  ForYou(themeFlutter: homeController.themeFlutter),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
