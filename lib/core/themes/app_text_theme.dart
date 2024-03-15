import 'package:flutter/material.dart';
import 'package:meal_prep/core/constants/color.dart';

class AppTextTheme {
  static TextTheme get light => const TextTheme(
        // Display
        displayLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
        // SubDisplay
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        // Heading
        headlineLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        // SubHeading
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        // Title
        titleLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        // SubTitle
        titleMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        // Body
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        // Description
        bodyLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
        // Small Description
        bodySmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w300,
          color: AppColors.kGrey,
        ),
        // Placeholder
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xffB4B9C0),
        ),
        // Button
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.kWhite,
        ),
        // Text Button
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.kGreen,
        ),
      );

  static TextTheme get dark => const TextTheme(
        // Display
        displayLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: AppColors.kWhite,
        ),
        // SubDisplay
        displaySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.kWhite,
        ),
        // Heading
        headlineLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.kWhite,
        ),
        // SubHeading
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.kWhite,
        ),
        // Title
        titleLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.kWhite,
        ),
        // SubTitle
        titleMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.kWhite,
        ),
        // Body
        titleSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.kWhite,
        ),
        // Description
        bodyLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: AppColors.kWhite,
        ),
        // Small Description
        bodySmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w300,
          color: AppColors.kWhite,
        ),
        // Placeholder
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xffB4B9C0),
        ),
        // Button
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.kWhite,
        ),
        // Text Button
        labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.kGreen,
        ),
      );
}
