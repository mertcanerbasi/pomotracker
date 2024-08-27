import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';
import 'package:pomotracker/app/router/app_router.routes.dart';

@RouteMapInit(typeSafe: true)
Route? onGenerateRoute(RouteSettings routeSettings) =>
    $onGenerateRoute(routeSettings, redirect: (route) {
      //FirebaseAuth.instance.signOut();

      return route;
    });
