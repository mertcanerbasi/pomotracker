import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/history/history_page.vm.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends BaseState<HistoryViewModel, HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryPage'),
      ),
    );
  }
}
