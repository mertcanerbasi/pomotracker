import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/app/app.dart';
import 'package:pomotracker/core/di/locator.dart';

void main() async {
  await setupDI("dev");
  runApp(const MyApp());
}
