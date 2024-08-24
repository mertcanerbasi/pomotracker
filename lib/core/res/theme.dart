import 'package:flutter/material.dart';
import 'package:pomotracker/core/res/color.dart';
import 'package:pomotracker/core/res/text_styles.dart';

class AppTheme {
  static ThemeData theme() => ThemeData(
        useMaterial3: true,
        highlightColor: AppColors.secondary,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: AppColors.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.accent,
          secondary: AppColors.secondary,
          surface: AppColors.primary,
        ),
        indicatorColor: AppColors.secondary,
        inputDecorationTheme: InputDecorationTheme(
          errorMaxLines: 2,
          iconColor: AppColors.secondary.withOpacity(0.8),
          labelStyle: AppTextStyle.captionRegular
              .copyWith(color: AppColors.secondary.withOpacity(0.8)),
          fillColor: AppColors.primary,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
        iconTheme: IconThemeData(color: AppColors.accent),
        appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primary,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: AppTextStyle.bodyMedium),
        listTileTheme: listTileTheme,
        bottomNavigationBarTheme: bottomNavigationBarTheme,
        textButtonTheme: textButtonTheme,
        elevatedButtonTheme: elevatedButtonTheme,
      );

  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      textStyle: AppTextStyle.button,
    ),
  );

  static ListTileThemeData listTileTheme = ListTileThemeData(
    tileColor: AppColors.primary,
    contentPadding: EdgeInsets.symmetric(horizontal: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    titleTextStyle: AppTextStyle.bodyRegular,
    subtitleTextStyle: AppTextStyle.captionRegular,
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: AppTextStyle.bodyMedium,
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    ),
  );

  static BottomNavigationBarThemeData bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    elevation: 0,
    backgroundColor: AppColors.primary,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.accent,
    enableFeedback: false,
    unselectedItemColor: AppColors.accent.lighten(0.3),
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedLabelStyle: AppTextStyle.bodyRegular,
  );
}
