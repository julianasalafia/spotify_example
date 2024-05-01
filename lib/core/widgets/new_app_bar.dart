import 'package:clone_spotify/core/shared/app_colors.dart';
import 'package:clone_spotify/core/shared/theme.dart';
import 'package:flutter/material.dart';

class NewAppBar extends StatelessWidget {
  final VoidCallback onPressed;
  final ThemeFlutter themeFlutter;

  const NewAppBar({
    super.key,
    required this.onPressed,
    required this.themeFlutter,
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
            themeFlutter.darkTheme ? Icons.dark_mode : Icons.light_mode,
            color: AppColors.mediumGrey,
          ),
        ),
      ),
    );
  }
}
