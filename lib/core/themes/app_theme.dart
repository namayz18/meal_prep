import 'package:flutter/material.dart';
import 'package:meal_prep/core/constants/color.dart';
import 'package:meal_prep/core/themes/app_text_theme.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: AppColors.kGreen,
          primary: AppColors.kGreen,
          onPrimary: AppColors.kWhite,
          secondary: AppColors.kGrey,
          onSecondary: AppColors.kLightGrey,
          tertiary: AppColors.kBlack,
        ),
        textTheme: AppTextTheme.light,
      );

  static ThemeData get dark => ThemeData(
        fontFamily: "Poppins",
        scaffoldBackgroundColor: AppColors.kDarkBlue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: AppColors.kGreen,
          primary: AppColors.kGreen,
          onPrimary: AppColors.kDarkBlueAccent,
          secondary: AppColors.kWhite,
          onSecondary: AppColors.kWhite,
          tertiary: AppColors.kWhite,
        ),
        textTheme: AppTextTheme.dark,
      );
}
