// Flutter imports:
import 'package:flutter/material.dart';
import 'package:pomotracker/core/res/color.dart';

class AppTextStyle {
  BuildContext context;
  AppTextStyle(this.context);
  static TextStyle loginAppName = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: AppColors.secondary,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.secondary,
  );

  static TextStyle headlineRegular = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );

  static TextStyle subheadingMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: AppColors.secondary,
  );

  static TextStyle bodyRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static TextStyle captionRegular = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondary,
  );

  static TextStyle captionMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.secondary,
  );

  static TextStyle minicaps = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );

  static TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );
}
