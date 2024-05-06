import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/main.dart';
import 'package:flutter/material.dart';

class NewAppBar extends StatelessWidget {
  final VoidCallback onPressed;

  const NewAppBar({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: TextButton(
          onPressed: onPressed,
          child: Icon(
            themeController.value ? Icons.dark_mode : Icons.light_mode,
            color: AppColors.mediumGrey,
          ),
        ),
      ),
    );
  }
}
