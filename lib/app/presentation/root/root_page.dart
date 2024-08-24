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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: (index) {
          viewModel.changePage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer_outlined),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_history_outlined,
            ),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: IndexedStack(
          index: viewModel.currentIndex,
          children: viewModel.pages,
        ),
      ),
    );
  }
}
