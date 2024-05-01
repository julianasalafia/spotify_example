
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import '../core/shared/app_colors.dart';
import '../core/shared/app_strings.dart';
import '../core/shared/app_styles.dart';
import '../core/widgets/grid_music.dart';
import '../core/widgets/main_menu.dart';

class Home extends StatelessWidget {
  HomeController homeController = HomeController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.softBlack,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: Column(
            children: [
              const SizedBox(height: 32),
              MainMenu(
                gridController: homeController.gridController,
              ),
              const SizedBox(height: 8),
              GridMusic(
                gridController: homeController.gridController,
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.forYou,
                    style: AppStyles.white24w700,
                  ),
                  Icon(
                    Icons.more_vert,
                    color: AppColors.mediumGrey,
                    size: 24,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
