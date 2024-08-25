import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:pomotracker/app/model/task.dart';
import 'package:pomotracker/app/presentation/history/history_page.vm.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/di/locator.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';
import 'package:uuid/uuid.dart';

@injectable
class HomeViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  HomeViewModel(this._localDataSource);

  bool _isAddingTask = false;
  bool get isAddingTask => _isAddingTask;
  void toggleAddingTask() {
    _isAddingTask = !isAddingTask;
    notifyListeners();
  }

  int _selectedPomodoro = 1;
  int get selectedPomodoro => _selectedPomodoro;
  void setselectedPomodoro(int selectedPomodoro) {
    _selectedPomodoro = selectedPomodoro;
    notifyListeners();
  }

  List<int> pomodoroOptions = [1, 2, 3, 4];

  int? get totalPomodoros => _todaysTasks.daysTasks
      .fold(0, (prev, task) => (prev ?? 0) + task.pomodoros.length);

  DaysTask _todaysTasks = DaysTask(daysTasks: [], date: '');
  DaysTask get todaysTasks => _todaysTasks;
  void settodaysTasks(DaysTask todaysTasks) {
    _todaysTasks = todaysTasks;
    notifyListeners();
  }

  // Text Editing Controllers
  final taskNameController = TextEditingController();

  // Local Data Operations
  Future<DaysTask?> getTaskForToday() async {
    var dateFormat = DateFormat('MM-dd-yyyy');
    var currentDate = dateFormat.format(DateTime.now());
    final tasks = await _localDataSource.getTaskByDate(currentDate);
    // Sort tasks to put those with all pomodoros completed at the top
    tasks?.daysTasks.sort((a, b) {
      bool aCompleted = a.pomodoros.every((pomodoro) => pomodoro.isCompleted);
      bool bCompleted = b.pomodoros.every((pomodoro) => pomodoro.isCompleted);
      if (aCompleted && !bCompleted) return -1; // a goes to the top
      if (!aCompleted && bCompleted)
        return 1; // b goes to the top
      else
        return 0; // Maintain current order if both are the same
    });
    settodaysTasks(tasks ?? DaysTask(daysTasks: [], date: currentDate));
    return tasks;
  }

  Future<void> saveTodaysTasks() async {
    // Create a new task with the provided details
    var task = Task(
      name: taskNameController.text,
      pomodoros: List.generate(
        selectedPomodoro,
        (index) => Pomodoro(isCompleted: false),
      ),
      id: Uuid().v4(),
    );

    // Add the new task to today's tasks
    todaysTasks.daysTasks.add(task);

    taskNameController.clear();
    setselectedPomodoro(1);

    // Save the sorted tasks again
    await _localDataSource.saveTask(todaysTasks);
    // Retrieve the updated list of tasks
    await getTaskForToday();
  }

  //Delete Task
  Future<void> deleteTask(Task task) async {
    todaysTasks.daysTasks.remove(task);
    if (todaysTasks.daysTasks.isEmpty) {
      await _localDataSource.deleteKey(todaysTasks.date);
    } else {
      await _localDataSource.saveTask(todaysTasks);
    }

    await getTaskForToday();
  }

  Future<void> completePomodoro(Task task, int index) async {
    task.pomodoros[index].isCompleted = !task.pomodoros[index].isCompleted;
    await _localDataSource.saveTask(todaysTasks);
    await getTaskForToday();
  }
}
