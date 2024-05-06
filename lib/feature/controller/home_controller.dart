import 'package:clone_spotify/core/shared/theme_controller.dart';

import 'grid_controller.dart';

class HomeController {
  final GridController gridController;
  final ThemeController themeController;

  HomeController({
    required this.gridController,
    required this.themeController,
  });
}
