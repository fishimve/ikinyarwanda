import 'package:flutter/material.dart';
import 'package:ikinyarwanda/shared/colors.dart';
import 'package:ikinyarwanda/shared/styles.dart';

class ThemeConfig {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryLight,
    cardColor: AppColors.cardLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    backgroundColor: AppColors.backgroundLight,
    indicatorColor: AppColors.inputLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
      elevation: 0,
      titleTextStyle: bodyStyle,
      actionsIconTheme: IconThemeData(
        color: AppColors.bodyTextLight,
        size: 22,
      ),
    ),
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
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      elevation: 0,
      titleTextStyle: bodyStyle,
      actionsIconTheme: IconThemeData(
        color: AppColors.bodyTextDark,
        size: 22,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryDark,
    ),
    iconTheme: IconThemeData(
      color: AppColors.bodyTextDark,
    ),
    brightness: Brightness.light,
  );
}
