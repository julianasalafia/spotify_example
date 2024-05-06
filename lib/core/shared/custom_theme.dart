import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Color backgroundColor;
  final Color textColor;
  final Color cardColor;
  final Color selectedColor;

  const CustomTheme({
    required this.backgroundColor,
    required this.textColor,
    required this.cardColor,
    required this.selectedColor,
  });

  @override
  ThemeExtension<CustomTheme> copyWith({
    Color? backgroundColor,
    Color? textColor,
    Color? cardColor,
    Color? selectedColor,
  }) {
    return CustomTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
      cardColor: cardColor ?? this.cardColor,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(covariant CustomTheme? other, double t) {
    return CustomTheme(
      backgroundColor: Color.lerp(backgroundColor, other!.backgroundColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      cardColor: Color.lerp(cardColor, other.cardColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
    );
  }
}
