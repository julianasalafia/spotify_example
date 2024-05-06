import 'package:clone_spotify/core/shared/custom_theme.dart';
import 'package:clone_spotify/core/widgets/for_you.dart';
import 'package:clone_spotify/core/widgets/grid.dart';
import 'package:clone_spotify/core/widgets/main_menu.dart';
import 'package:clone_spotify/core/widgets/new_app_bar.dart';
import 'package:clone_spotify/feature/controller/grid_controller.dart';
import 'package:clone_spotify/feature/controller/home_controller.dart';
import 'package:clone_spotify/main.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final HomeController homeController = HomeController(
    gridController: GridController(),
    themeController: themeController,
  );

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomTheme>()!;
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              NewAppBar(onPressed: () {
                themeController.toggleTheme();
              }),
              MainMenu(gridController: homeController.gridController),
              Grid(gridController: homeController.gridController),
              const ForYou(),
            ],
          ),
        ),
      ),
    );
  }
}
