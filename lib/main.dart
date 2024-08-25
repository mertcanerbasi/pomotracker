import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/app/app.dart';
import 'package:pomotracker/core/di/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI("dev");
  runApp(MyApp());
}
