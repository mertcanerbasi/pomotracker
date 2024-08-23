// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:pomotracker/app/presentation/splash/splash.dart';
import 'package:pomotracker/app/presentation/root/root_page.dart';
import 'package:pomotracker/app/presentation/onboarding/onboarding_page.dart';

class RouteMaps {
  static const String splashRoute = "splash";
  static const String root = "/";
  static const String onboardingRoute = "/onboarding_page";
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
