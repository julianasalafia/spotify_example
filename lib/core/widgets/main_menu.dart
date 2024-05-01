import 'dart:developer';

import 'package:clone_spotify/controller/grid_controller.dart';
import 'package:clone_spotify/core/shared/app_strings.dart';
import 'package:flutter/material.dart';

import 'button_widget.dart';

class MainMenu extends StatelessWidget {
  GridController gridController;

  MainMenu({
    super.key,
    required this.gridController,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> selectedButtonIndex = ValueNotifier(-1);

    return Row(
      children: [
        ValueListenableBuilder<int>(
            valueListenable: selectedButtonIndex,
            builder: (context, value, child) {
              gridController.setList(selectedButtonIndex.value);
              return Container(
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
              );
            }),
        const SizedBox(width: 8),
        ButtonWidget(
          onTap: () {
            log('Botão clicado: ${AppStrings.musica}');
            gridController.setList(0);
          },
          title: AppStrings.musica,
          selectedButtonIndex: selectedButtonIndex,
          buttonIndex: 0,
        ),
        const SizedBox(width: 8),
        ButtonWidget(
          onTap: () {
            log('Botão clicado: ${AppStrings.podcast}');
            gridController.setList(1);
          },
          title: AppStrings.podcast,
          selectedButtonIndex: selectedButtonIndex,
          buttonIndex: 1,
        ),
      ],
    );
  }
}
