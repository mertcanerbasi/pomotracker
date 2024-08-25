import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/history/history_page.vm.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:pomotracker/core/res/text_styles.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends BaseState<HistoryViewModel, HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: viewModel.getAllTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  var date = snapshot.data?[index]?.date;
                  var totalPomodoros = snapshot.data?[index]?.daysTasks
                      .fold(0, (prev, task) => (prev) + task.pomodoros.length);
                  var tasks = snapshot.data?[index]?.daysTasks ?? [];

                  return ExpansionTile(
                    title: Text(
                      "Date",
                      style: AppTextStyle.bodyMedium,
                    ),
                    subtitle: Text(
                      date ?? '',
                    ),
                    trailing: Text(
                      "${totalPomodoros ?? 0}",
                      style: AppTextStyle.bodyMedium,
                    ),
                    children: tasks.map((task) {
                      return ListTile(
                        leading: Icon(
                          Icons.check_circle,
                          size: 20,
                          color: task.pomodoros
                                  .every((pomodoro) => pomodoro.isCompleted)
                              ? Colors.green
                              : Colors.red,
                        ),
                        title: Text(
                          "${task.name}", // Assuming `task.title` exists
                        ),
                        subtitle: Text(
                          "${task.pomodoros.length} pomodoros",
                        ),
                      );
                    }).toList(),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
