// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RouteMapConfigGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:pomotracker/app/presentation/home/home_page.dart';
import 'package:pomotracker/app/presentation/edit_task/edit_task.dart';
import 'package:pomotracker/app/presentation/history/history_page.dart';
import 'package:pomotracker/app/presentation/pomodoro/pomodoro_page.dart';
import 'package:pomotracker/app/presentation/root/root_page.dart';
import 'package:pomotracker/app/model/task.dart';

class RouteMaps {
  static const String homeRoute = "/home_page";
  static const String editTaskRoute = "/edit_task_page";
  static const String historyRoute = "/history_page";
  static const String pomodoroRoute = "/pomodoro_page";
  static const String root = "/";
}

Map<String, RouteModel> get routes => _routes;
final Map<String, RouteModel> _routes = {
  RouteMaps.homeRoute: RouteModel(
    (_) => const HomePage(),
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
  RouteMaps.pomodoroRoute: RouteModel(
    (c) => PomodoroPage(
      day: c.routeArgsWithKey<String>("day")!,
      taskId: c.routeArgsWithKey<String>("taskId")!,
    ),
  ),
  RouteMaps.root: RouteModel(
    (_) => const RootPage(),
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
