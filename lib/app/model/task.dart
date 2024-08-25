class DaysTask {
  final String date;
  final List<Task> daysTasks;
  DaysTask({
    required this.daysTasks,
    required this.date,
  });

  DaysTask copyWith({
    List<Task>? tasks,
  }) {
    return DaysTask(
      daysTasks: tasks ?? this.daysTasks,
      date: date,
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'tasks': daysTasks.map((e) => e.toJson()).toList(),
      'date': date,
    };
  }

  //fromJson
  factory DaysTask.fromJson(Map<String, dynamic> json) {
    return DaysTask(
      daysTasks: List<Task>.from(json['tasks']?.map((x) => Task.fromJson(x))),
      date: json['date'],
    );
  }
}

class Task {
  String name;
  final String id;
  List<Pomodoro> pomodoros;

  Task({
    required this.name,
    required this.pomodoros,
    required this.id,
  });

  Task copyWith({
    String? name,
    String? id,
    List<Pomodoro>? pomodoros,
  }) {
    return Task(
      name: name ?? this.name,
      id: id ?? this.id,
      pomodoros: pomodoros ?? this.pomodoros,
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'pomodoros': pomodoros.map((e) => e.toJson()).toList(),
    };
  }

  //fromJson
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      id: json['id'],
      pomodoros: List<Pomodoro>.from(
          json['pomodoros']?.map((x) => Pomodoro.fromJson(x))),
    );
  }
}

class Pomodoro {
  bool isCompleted;
  Pomodoro({
    required this.isCompleted,
  });

  Pomodoro copyWith({
    bool? isCompleted,
  }) {
    return Pomodoro(
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'isCompleted': isCompleted,
    };
  }

  //fromJson
  factory Pomodoro.fromJson(Map<String, dynamic> json) {
    return Pomodoro(
      isCompleted: json['isCompleted'],
    );
  }
}
