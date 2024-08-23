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
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.currentIndex,
        onTap: (index) {
          viewModel.changePage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
