// ignore_for_file: unused_field
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:pomotracker/app/model/app_settings.dart';
import 'package:pomotracker/app/model/task.dart';

abstract class LocalDataSource {
  Future<void> clear();
  Future<void> setAppSettings(ApplicationSettings appSettings);
  ApplicationSettings? get appSettings;
  Future<List<DaysTask>> getAllTasks();
  Future<DaysTask?> getTaskByDate(String date);
  Future<void> saveTask(DaysTask task);
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final GetStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);

  @override
  Future<void> clear() async {
    _getStorage.erase();
    return;
  }

  Future<void> setAppSettings(ApplicationSettings appSettings) async {
    // Save app settings to local storage
    return _getStorage.write("appSettings", appSettings.toJson());
  }

  ApplicationSettings? get appSettings {
    // Get app settings from local storage
    final settings = _getStorage.read("appSettings");
    if (settings != null) {
      return ApplicationSettings.fromJson(settings);
    }
    return null;
  }

  @override
  Future<List<DaysTask>> getAllTasks() {
    // Get all tasks from local storage
    final tasks = _getStorage.getKeys().map((e) {
      if (e == "language" || e == "onBoarded") {
      } else {
        final task = _getStorage.read(e);
        return DaysTask.fromJson(task);
      }
    }).toList();
    return Future.value(tasks);
  }

  @override
  Future<DaysTask?> getTaskByDate(String date) {
    // Get task from local storage
    final task = _getStorage.read(date);
    if (task != null) {
      return Future.value(DaysTask.fromJson(task));
    }
    return Future.value(null);
  }

  @override
  Future<void> saveTask(DaysTask task) {
    // Save task to local storage
    return _getStorage.write(task.date, task.toJson());
  }
}
