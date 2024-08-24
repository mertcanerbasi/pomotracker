import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pomotracker/app/presentation/app/app.dart';
import 'package:pomotracker/core/di/locator.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI("dev");

  // Android initialization
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  // iOS initialization
  final DarwinInitializationSettings initializationSettingsIOS =
      DarwinInitializationSettings(
          requestSoundPermission: true,
          requestAlertPermission: true,
          requestBadgePermission: true);

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  runApp(MyApp());
}
