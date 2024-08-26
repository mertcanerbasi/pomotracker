import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pomotracker/app/model/task.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';

@injectable
class EditTaskViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  EditTaskViewModel(this._localDataSource);

  late DaysTask _daysTasks;
  DaysTask get daysTasks => _daysTasks;
  void setdaysTasks(DaysTask daysTasks) {
    _daysTasks = daysTasks;
    notifyListeners();
  }

  late String _taskId;
  String get taskId => _taskId;
  void settaskId(String taskId) {
    _taskId = taskId;
    notifyListeners();
  }

  void init(String taskId, DaysTask daysTasks) {
    setdaysTasks(daysTasks);
    settaskId(taskId);
    taskNameController.text =
        daysTasks.daysTasks.where((element) => element.id == taskId).first.name;
  }

  TextEditingController taskNameController = TextEditingController();

  // is Add button enabled
  bool get isAddButtonEnabled {
    if (daysTasks.daysTasks
            .where((element) => element.id == taskId)
            .firstOrNull ==
        null) {
      return false;
    } else {
      return daysTasks.daysTasks
              .where((element) => element.id == taskId)
              .first
              .pomodoros
              .length <
          4;
    }
  }

  bool get isRemoveButtonEnabled {
    if (daysTasks.daysTasks
            .where((element) => element.id == taskId)
            .firstOrNull ==
        null) {
      return false;
    } else {
      return daysTasks.daysTasks
              .where((element) => element.id == taskId)
              .first
              .pomodoros
              .length >
          1;
    }
  }

  //Save task
  Future<void> saveTask() async {
    var task =
        daysTasks.daysTasks.where((element) => element.id == taskId).first;
    task.name = taskNameController.text;
    await _localDataSource.saveTask(daysTasks);
  }

  Future<void> completePomodoro(Task task, int index) async {
    task.pomodoros[index].isCompleted = !task.pomodoros[index].isCompleted;
    await _localDataSource.saveTask(daysTasks);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    daysTasks.daysTasks.remove(task);
    if (daysTasks.daysTasks.isEmpty) {
      await _localDataSource.deleteKey(daysTasks.date);
    } else {
      await _localDataSource.saveTask(daysTasks);
    }
    notifyListeners();
  }
}
