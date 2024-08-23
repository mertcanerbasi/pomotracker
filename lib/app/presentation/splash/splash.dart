import 'package:flutter/material.dart';
import 'package:pomotracker/core/res/text_styles.dart';

import 'package:route_map/route_map.dart';

@RouteMap(name: "splash")
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Splash",
        style: AppTextStyle.titleMedium,
      ),
    ));
  }
}
