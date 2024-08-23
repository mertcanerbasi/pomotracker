import 'package:flutter/material.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnboardingPage'),
      ),
    );
  }
}
