import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pomotracker/app/presentation/history/history_page.dart';
import 'package:pomotracker/app/presentation/home/home_page.dart';
import 'package:pomotracker/app/presentation/settings/settings_page.dart';
import 'package:pomotracker/core/base/base_view_model.dart';

@injectable
class RootViewModel extends BaseViewModel {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void setcurrentIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  void changePage(int index) {
    setcurrentIndex(index);
  }

  PageController pageController = PageController();

  List<Widget> pages = [
    HomePage(),
    HistoryPage(),
    SettingsPage(),
  ];
}
