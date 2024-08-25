import 'package:flutter/material.dart';
import 'package:pomotracker/app/model/task.dart';
import 'package:pomotracker/app/presentation/history/history_page.vm.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:pomotracker/core/res/color.dart';
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
        child: Column(
          children: [
            Row(
              children: [
                Text("History", style: AppTextStyle.headlineMedium),
                Spacer(),
              ],
            ),
            StreamBuilder<List<DaysTask?>>(
              stream: viewModel.tasksStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  if (snapshot.data?.isEmpty ?? true) {
                    return ListTile(
                      title: Text("No tasks history"),
                      subtitle: Text(
                          "You have not completed or created any tasks yet"),
                      trailing: Icon(Icons.sentiment_dissatisfied),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var reversedData =
                            snapshot.data?.reversed.toList()[index];
                        var date = reversedData?.date;
                        var totalPomodoros = reversedData?.daysTasks.fold(
                            0, (prev, task) => (prev) + task.pomodoros.length);
                        var tasks = reversedData?.daysTasks ?? [];

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
                          dense: true,
                          children: tasks.map((task) {
                            return ListTile(
                              leading: task.pomodoros
                                      .every((pomodoro) => pomodoro.isCompleted)
                                  ? Icon(
                                      Icons.check,
                                      size: 20,
                                      color: AppColors.accent,
                                    )
                                  : Icon(
                                      Icons.radio_button_unchecked,
                                      size: 20,
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
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
