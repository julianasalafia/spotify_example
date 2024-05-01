import 'dart:developer';

import 'package:clone_spotify/core/shared/app_styles.dart';
import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final ValueNotifier<int> selectedButtonIndex;
  final int buttonIndex;
  final Function() onTap;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.selectedButtonIndex,
    required this.buttonIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        log('Botão clicado: $title');
        if (selectedButtonIndex.value == buttonIndex) {
          selectedButtonIndex.value = -1;
        } else {
          selectedButtonIndex.value = buttonIndex;
        }
      },
      child: ValueListenableBuilder(
        valueListenable: selectedButtonIndex,
        builder: (context, value, child) {
          return Container(
            decoration: BoxDecoration(
              color: selectedButtonIndex.value == buttonIndex ? AppColors.green : AppColors.darkGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                title,
                style: selectedButtonIndex.value == buttonIndex
                    ? AppStyles.white12w400.copyWith(
                        color: AppColors.deepBlack,
                      )
                    : AppStyles.white12w400,
              ),
            ),
          );
        },
      ),
    );
  }
}
