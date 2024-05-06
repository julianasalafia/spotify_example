import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/core/shared/app_strings.dart';
import 'package:clone_spotify/core/shared/app_text_styles.dart';
import 'package:clone_spotify/core/shared/custom_theme.dart';
import 'package:flutter/material.dart';

class ForYou extends StatelessWidget {
  const ForYou({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomTheme>()!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.forYou,
            style: AppTextStyles.black24w700.copyWith(
              color: theme.textColor,
            ),
          ),
          const Icon(
            Icons.more_vert,
            color: AppColors.mediumGrey,
            size: 24,
          ),
        ],
      ),
    );
  }
}
