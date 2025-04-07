import 'package:flutter/material.dart';
import 'package:job_listing/constant/app_colors.dart';


class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: AppColors.lightPrimary as MaterialColor,
    scaffoldBackgroundColor: AppColors.lightScaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightAppBarBackground,
      foregroundColor: AppColors.lightAppBarForeground,
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: AppColors.darkPrimary as MaterialColor,
    scaffoldBackgroundColor: AppColors.darkScaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkAppBarBackground,
      foregroundColor: AppColors.darkAppBarForeground,
    ),
  );
}


