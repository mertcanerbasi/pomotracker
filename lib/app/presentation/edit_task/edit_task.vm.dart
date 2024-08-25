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
  bool get isAddButtonEnabled =>
      daysTasks.daysTasks
          .where((element) => element.id == taskId)
          .first
          .pomodoros
          .length <
      4;

  bool get isRemoveButtonEnabled =>
      daysTasks.daysTasks
          .where((element) => element.id == taskId)
          .first
          .pomodoros
          .length >
      1;

  //Save task
  Future<void> saveTask() async {
    var task =
        daysTasks.daysTasks.where((element) => element.id == taskId).first;
    task.name = taskNameController.text;
    await _localDataSource.saveTask(daysTasks);
  }
}
