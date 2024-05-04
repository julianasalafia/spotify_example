import 'package:clone_spotify/core/shared/app_strings.dart';
import 'package:clone_spotify/feature/controller/grid_controller.dart';
import 'package:clone_spotify/feature/models/filter_type.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class MainMenu extends StatelessWidget {
  final GridController gridController;

  const MainMenu({
    super.key,
    required this.gridController,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: gridController.currentFilter,
      builder: (context, value, child) {
        return Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  AppStrings.profilePicture,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Button(
              onTap: () {
                gridController.setList(type: FilterType.album);
              },
              isSelected: value == FilterType.album,
              title: AppStrings.musica,
            ),
            const SizedBox(width: 8),
            Button(
              onTap: () {
                gridController.setList(type: FilterType.podcast);
              },
              isSelected: value == FilterType.podcast,
              title: AppStrings.podcast,
            ),
          ],
        );
      },
    );
  }
}
