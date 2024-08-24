import 'package:flutter/material.dart';
import 'package:pomotracker/core/di/locator.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';
import 'package:route_map/route_map.dart';
import 'package:pomotracker/app/router/app_router.routes.dart';

@RouteMapInit(typeSafe: true)
Route? onGenerateRoute(RouteSettings routeSettings) =>
    $onGenerateRoute(routeSettings, redirect: (route) {
      //FirebaseAuth.instance.signOut();

      if (RouteMaps.splashRoute.contains(route)) {
        var localDataSource = getIt<LocalDataSource>();
        var appSettings = localDataSource.appSettings;
        if (appSettings?.onBoarded == true) {
          return RouteMaps.root;
        } else {
          return RouteMaps.onboardingRoute;
        }
      }
      return route;
    });
