import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:pomotracker/app/model/task.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/local_data_source/local_data_source.dart';
import 'package:timezone/timezone.dart' as tz;

@injectable
class PomodoroViewModel extends BaseViewModel {
  final LocalDataSource _localDataSource;
  PomodoroViewModel(this._localDataSource);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final _isPomodoroCompletedController = StreamController<bool>.broadcast();
  Stream<bool> get isPomodoroCompleted => _isPomodoroCompletedController.stream;

  void init(String taskId, String day) {
    getTask(day, taskId);
  }

  Task? _task;
  Task? get task => _task;
  void settask(Task? task) {
    _task = task;
    notifyListeners();
  }

  DaysTask? _dayTasks;
  DaysTask? get dayTasks => _dayTasks;
  void setdayTasks(DaysTask? dayTasks) {
    _dayTasks = dayTasks;
    notifyListeners();
  }

  // Timer
  Timer? timer;

  bool _isTimerRunning = false;
  bool get isTimerRunning => _isTimerRunning;
  void setisTimerRunning(bool isTimerRunning) {
    _isTimerRunning = isTimerRunning;
    notifyListeners();
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  void setstartDate(DateTime? startDate) {
    _startDate = startDate;
    notifyListeners();
  }

  // Difference between start and end date
  Duration get timeElapsed {
    if (startDate != null) {
      Duration elapsed = DateTime.now().difference(startDate!);
      Duration remaining = Duration(minutes: 25) - elapsed;
      return remaining.isNegative ? Duration.zero : remaining;
    }
    return Duration(minutes: 25);
  }

  void startTimer() {
    if (_isTimerRunning) return;

    setisTimerRunning(true);
    scheduleAlarm();
    setstartDate(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (DateTime.now().difference(startDate!).inMinutes >= 25) {
        endTimer();
        return;
      }
      notifyListeners();
    });
  }

  Future<void> endTimer() async {
    timer?.cancel();
    setisTimerRunning(false);
    setstartDate(null);
    _isPomodoroCompletedController.add(true);
    await cancelAlarm();
  }

  Future<void> scheduleAlarm() async {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
        now.hour, now.minute + 25, now.second);

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'pomodoro_channel_id', // Channel ID
      'Pomodoro Timer', // Channel Name
      importance: Importance.max,
      priority: Priority.high,
      playSound: true, // Play the default alarm sound
      sound: RawResourceAndroidNotificationSound('alarm'),
    );

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentSound: true, // Play the default alarm sound
      sound: 'alarm.aiff',
    );

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Pomodoro Timer',
      'Your session has ended!',
      scheduledDate,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelAlarm() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  Future<Task?> getTask(String date, String taskId) async {
    final tasks = await _localDataSource.getTaskByDate(date);
    setdayTasks(tasks);
    if (tasks != null) {
      final task =
          tasks.daysTasks.firstWhere((element) => element.id == taskId);
      settask(task);
      return task;
    }
    return null;
  }
}
