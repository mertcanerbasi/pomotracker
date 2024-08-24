// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:pomotracker/app/presentation/settings/settings_page.dart';
import 'package:pomotracker/app/presentation/home/home_page.dart';
import 'package:pomotracker/app/presentation/splash/splash.dart';
import 'package:pomotracker/app/presentation/history/history_page.dart';
import 'package:pomotracker/app/presentation/pomodoro/pomodoro_page.dart';
import 'package:pomotracker/app/presentation/root/root_page.dart';
import 'package:pomotracker/app/presentation/onboarding/onboarding_page.dart';

class RouteMaps {
  static const String settingsRoute = "/settings_page";
  static const String homeRoute = "/home_page";
  static const String splashRoute = "splash";
  static const String historyRoute = "/history_page";
  static const String pomodoroRoute = "/pomodoro_page";
  static const String root = "/";
  static const String onboardingRoute = "/onboarding_page";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.settingsRoute: RouteModel(
    (_) => const SettingsPage(),
  ),
  RouteMaps.homeRoute: RouteModel(
    (_) => const HomePage(),
  ),
  RouteMaps.splashRoute: RouteModel(
    (_) => const SplashPage(),
  ),
  RouteMaps.historyRoute: RouteModel(
    (_) => const HistoryPage(),
  ),
  RouteMaps.pomodoroRoute: RouteModel(
    (c) => PomodoroPage(
      day: c.routeArgsWithKey<String>("day")!,
      taskId: c.routeArgsWithKey<String>("taskId")!,
    ),
  ),
  RouteMaps.root: RouteModel(
    (_) => const RootPage(),
  ),
  RouteMaps.onboardingRoute: RouteModel(
    (_) => const OnboardingPage(),
  ),
};
Route? $onGenerateRoute(RouteSettings routeSettings,
        {String? Function(String routeName)? redirect}) =>
    onGenerateRouteWithRoutesSettings(
      routeSettings,
      routes,
      redirect: redirect,
    );

class SettingsRoute extends BaseRoute {
  SettingsRoute() : super(RouteMaps.settingsRoute);
  static const String name = RouteMaps.settingsRoute;
}

class HomeRoute extends BaseRoute {
  HomeRoute() : super(RouteMaps.homeRoute);
  static const String name = RouteMaps.homeRoute;
}

class SplashRoute extends BaseRoute {
  SplashRoute() : super(RouteMaps.splashRoute);
  static const String name = RouteMaps.splashRoute;
}

class HistoryRoute extends BaseRoute {
  HistoryRoute() : super(RouteMaps.historyRoute);
  static const String name = RouteMaps.historyRoute;
}

class PomodoroRoute extends BaseRoute {
  PomodoroRoute({
    required String day,
    required String taskId,
  }) : super(RouteMaps.pomodoroRoute,
            args: PomodoroRouteArgs(
              day: day,
              taskId: taskId,
            ).map);
  static const String name = RouteMaps.pomodoroRoute;
}

class PomodoroRouteArgs {
  final String day;
  final String taskId;
  PomodoroRouteArgs({
    required this.day,
    required this.taskId,
  });
  Map<String, dynamic>? get map => {
        "day": day,
        "taskId": taskId,
      };
}

class RootRoute extends BaseRoute {
  RootRoute() : super(RouteMaps.root);
  static const String name = RouteMaps.root;
}

class OnboardingRoute extends BaseRoute {
  OnboardingRoute() : super(RouteMaps.onboardingRoute);
  static const String name = RouteMaps.onboardingRoute;
}
