import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/core/shared/app_text_styles.dart';
import 'package:clone_spotify/core/shared/custom_theme.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const Button({
    super.key,
    required this.title,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<CustomTheme>()!;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? theme.selectedColor : theme.cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: isSelected
                ? AppTextStyles.white12w400.copyWith(
                    color: AppColors.deepBlack,
                  )
                : AppTextStyles.white12w400.copyWith(
                    color: theme.textColor,
                  ),
          ),
        ),
      ),
    );
  }
}
