// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  BuildContext context;
  AppTextStyle(this.context);
  static TextStyle loginAppName = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static TextStyle headlineMedium = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle headlineRegular = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle titleMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle subheadingMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle bodyRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle captionRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle minicaps = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle button = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
