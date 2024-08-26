import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pomotracker/app/model/task.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';

@injectable
class HistoryViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  HistoryViewModel(this._localDataSource);

  List<DaysTask?>? _tasksList;
  List<DaysTask?>? get tasksList => _tasksList;
  void settasksList(List<DaysTask?>? tasksList) {
    _tasksList = tasksList;
    notifyListeners();
  }

  List<DaysTask?>? _filteredTasks;
  List<DaysTask?>? get filteredTasks => _filteredTasks;
  void setfilteredTasks(List<DaysTask?>? filteredTasks) {
    _filteredTasks = filteredTasks;
    notifyListeners();
  }

  Stream<List<DaysTask?>> tasksStream() {
    return _localDataSource.tasksStream;
  }

  bool _isFiltered = false;
  bool get isFiltered => _isFiltered;
  void toggleFilter() {
    if (_isFiltered) {
      setfilteredTasks(null);
      searchController.clear();
    }
    _isFiltered = !_isFiltered;
    notifyListeners();
  }

  TextEditingController searchController = TextEditingController();

  void filterTasks(String value) {
    if (value.isEmpty) {
      setfilteredTasks(null);
      return;
    }
    final filtered = tasksList?.where((element) {
      return element?.daysTasks.any((task) {
            return task.name.toLowerCase().contains(value.toLowerCase());
          }) ??
          false;
    }).toList();
    setfilteredTasks(filtered);
  }
}
