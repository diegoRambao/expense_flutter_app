import 'package:flutter/material.dart';
import 'package:spend_flutter_app/core/constants/app_colors.dart';

class AppTextStyles {
  // ---- Light ----
  static const TextStyle headlineLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  static const TextStyle moneyPositive = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.secondary,
  );

  static const TextStyle moneyNegative = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: AppColors.error,
  );

  // ---- Dark ----
  static const TextStyle darkHeadlineLarge = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: AppColors.darkTextPrimary,
  );

  static const TextStyle darkBodyMedium = TextStyle(
    fontSize: 14,
    color: AppColors.darkTextSecondary,
  );
}
