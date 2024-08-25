// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:pomotracker/app/presentation/home/home_page.dart';
import 'package:pomotracker/app/presentation/splash/splash.dart';
import 'package:pomotracker/app/presentation/edit_task/edit_task.dart';
import 'package:pomotracker/app/presentation/history/history_page.dart';
import 'package:pomotracker/app/presentation/root/root_page.dart';
import 'package:pomotracker/app/presentation/onboarding/onboarding_page.dart';
import 'package:pomotracker/app/model/task.dart';

class RouteMaps {
  static const String homeRoute = "/home_page";
  static const String splashRoute = "splash";
  static const String editTaskRoute = "/edit_task_page";
  static const String historyRoute = "/history_page";
  static const String root = "/";
  static const String onboardingRoute = "/onboarding_page";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.homeRoute: RouteModel(
    (_) => const HomePage(),
  ),
  RouteMaps.splashRoute: RouteModel(
    (_) => const SplashPage(),
  ),
  RouteMaps.editTaskRoute: RouteModel(
    (c) => EditTaskPage(
      daysTasks: c.routeArgsWithKey<DaysTask>("daysTasks")!,
      taskId: c.routeArgsWithKey<String>("taskId")!,
    ),
    fullscreenDialog: true,
  ),
  RouteMaps.historyRoute: RouteModel(
    (_) => const HistoryPage(),
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

class HomeRoute extends BaseRoute {
  HomeRoute() : super(RouteMaps.homeRoute);
  static const String name = RouteMaps.homeRoute;
}

class SplashRoute extends BaseRoute {
  SplashRoute() : super(RouteMaps.splashRoute);
  static const String name = RouteMaps.splashRoute;
}

class EditTaskRoute extends BaseRoute {
  EditTaskRoute({
    required DaysTask daysTasks,
    required String taskId,
  }) : super(RouteMaps.editTaskRoute,
            args: EditTaskRouteArgs(
              daysTasks: daysTasks,
              taskId: taskId,
            ).map);
  static const String name = RouteMaps.editTaskRoute;
}

class EditTaskRouteArgs {
  final DaysTask daysTasks;
  final String taskId;
  EditTaskRouteArgs({
    required this.daysTasks,
    required this.taskId,
  });
  Map<String, dynamic>? get map => {
        "daysTasks": daysTasks,
        "taskId": taskId,
      };
}

class HistoryRoute extends BaseRoute {
  HistoryRoute() : super(RouteMaps.historyRoute);
  static const String name = RouteMaps.historyRoute;
}

class RootRoute extends BaseRoute {
  RootRoute() : super(RouteMaps.root);
  static const String name = RouteMaps.root;
}

class OnboardingRoute extends BaseRoute {
  OnboardingRoute() : super(RouteMaps.onboardingRoute);
  static const String name = RouteMaps.onboardingRoute;
}
