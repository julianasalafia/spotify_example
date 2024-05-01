import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/core/shared/app_styles.dart';
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
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green : AppColors.darkGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: isSelected
                ? AppStyles.white12w400.copyWith(
                    color: AppColors.deepBlack,
                  )
                : AppStyles.white12w400,
          ),
        ),
      ),
    );
  }
}
