import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/root/root_page.vm.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';

@RouteMap(name: "/")
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootState createState() => _RootState();
}

class _RootState extends BaseState<RootViewModel, RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RootPage'),
      ),
    );
  }
}
