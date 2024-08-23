import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/settings/settings_page.vm.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends BaseState<SettingsViewModel, SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsPage'),
      ),
    );
  }
}
