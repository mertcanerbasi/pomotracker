import 'package:flutter/material.dart';
import 'package:pomotracker/core/res/color.dart';

class AppTheme {
  static ThemeData theme() => ThemeData(
        useMaterial3: true,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: AppColors.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
      );
}
