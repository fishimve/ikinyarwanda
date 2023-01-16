import 'package:flutter/material.dart';
import 'package:ikinyarwanda/shared/colors.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    cardColor: AppColors.cardLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    backgroundColor: AppColors.backgroundLight,
    indicatorColor: AppColors.inputLight,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryLight,
    ),
    iconTheme: IconThemeData(
      color: AppColors.bodyTextLight,
    ),
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    cardColor: AppColors.cardDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    backgroundColor: AppColors.backgroundDark,
    indicatorColor: AppColors.inputDark,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryDark,
    ),
    iconTheme: IconThemeData(
      color: AppColors.bodyTextDark,
    ),
    brightness: Brightness.light,
  );
}
