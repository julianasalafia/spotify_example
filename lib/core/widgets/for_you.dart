import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/core/shared/app_strings.dart';
import 'package:clone_spotify/core/shared/app_text_styles.dart';
import 'package:clone_spotify/core/shared/theme.dart';
import 'package:flutter/material.dart';

class ForYou extends StatelessWidget {
  final ThemeFlutter themeFlutter;
  const ForYou({
    super.key,
    required this.themeFlutter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: AnimatedBuilder(
        animation: themeFlutter,
        builder: (context, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.forYou,
                style: themeFlutter.darkTheme ? AppTextStyles.white24w700 : AppTextStyles.black24w700,
              ),
              const Icon(
                Icons.more_vert,
                color: AppColors.mediumGrey,
                size: 24,
              ),
            ],
          );
        },
      ),
    );
  }
}
