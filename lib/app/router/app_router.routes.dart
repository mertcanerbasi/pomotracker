// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:pomotracker/app/presentation/splash/splash.dart';
import 'package:pomotracker/app/presentation/root/root_page.dart';
import 'package:pomotracker/app/presentation/onboarding/onboarding_page.dart';
import 'package:pomotracker/app/presentation/home/home_page.dart';
import 'package:pomotracker/app/presentation/settings/settings_page.dart';
import 'package:pomotracker/app/presentation/history/history_page.dart';

class RouteMaps {
  static const String splashRoute = "splash";
  static const String root = "/";
  static const String onboardingRoute = "/onboarding_page";
  static const String homeRoute = "/home_page";
  static const String settingsRoute = "/settings_page";
  static const String historyRoute = "/history_page";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.splashRoute: RouteModel(
    (_) => const SplashPage(),
  ),
  RouteMaps.root: RouteModel(
    (_) => const RootPage(),
  ),
  RouteMaps.onboardingRoute: RouteModel(
    (_) => const OnboardingPage(),
  ),
  RouteMaps.homeRoute: RouteModel(
    (_) => const HomePage(),
  ),
  RouteMaps.settingsRoute: RouteModel(
    (_) => const SettingsPage(),
  ),
  RouteMaps.historyRoute: RouteModel(
    (_) => const HistoryPage(),
  ),
};
Route? $onGenerateRoute(RouteSettings routeSettings,
        {String? Function(String routeName)? redirect}) =>
    onGenerateRouteWithRoutesSettings(
      routeSettings,
      routes,
      redirect: redirect,
    );

class SplashRoute extends BaseRoute {
  SplashRoute() : super(RouteMaps.splashRoute);
  static const String name = RouteMaps.splashRoute;
}

class RootRoute extends BaseRoute {
  RootRoute() : super(RouteMaps.root);
  static const String name = RouteMaps.root;
}

class OnboardingRoute extends BaseRoute {
  OnboardingRoute() : super(RouteMaps.onboardingRoute);
  static const String name = RouteMaps.onboardingRoute;
}

class HomeRoute extends BaseRoute {
  HomeRoute() : super(RouteMaps.homeRoute);
  static const String name = RouteMaps.homeRoute;
}

class SettingsRoute extends BaseRoute {
  SettingsRoute() : super(RouteMaps.settingsRoute);
  static const String name = RouteMaps.settingsRoute;
}

class HistoryRoute extends BaseRoute {
  HistoryRoute() : super(RouteMaps.historyRoute);
  static const String name = RouteMaps.historyRoute;
}
