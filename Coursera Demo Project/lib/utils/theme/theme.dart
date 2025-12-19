
import 'package:flutter/material.dart';
import 'package:globe_pulse/utils/constants/app_colors.dart';
class TAppTheme{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColorLT,
    scaffoldBackgroundColor: AppColors.backgroundColorLT,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColorLT,
      foregroundColor: AppColors.textPrimaryColorLT,
    ),
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColorDT,
      scaffoldBackgroundColor: AppColors.backgroundColorDT,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColorDT,
        foregroundColor: AppColors.textPrimaryColorDT,
      ),
  );
}