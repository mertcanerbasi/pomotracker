import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomotracker/app/presentation/home/home_page.vm.dart';
import 'package:pomotracker/app/router/app_router.routes.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:pomotracker/core/res/color.dart';
import 'package:pomotracker/core/res/text_styles.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseState<HomeViewModel, HomePage> {
  @override
  initState() {
    super.initState();
    viewModel.getTaskForToday();
  }

  @override
  Widget build(BuildContext context) {
    var date = DateFormat.yMEd().format(DateTime.now()); //yMEd

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text("PomoTracker", style: AppTextStyle.headlineMedium),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      viewModel.toggleAddingTask();
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text("Today", style: AppTextStyle.bodyMedium),
                subtitle: Text(date, style: AppTextStyle.captionRegular),
                trailing: Text("${viewModel.totalPomodoros ?? 0}",
                    style: AppTextStyle.bodyMedium),
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: viewModel.isAddingTask ? 300 : 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          TextField(
                            style: AppTextStyle.captionMedium,
                            controller: viewModel.taskNameController,
                            autocorrect: false,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              labelText: "Task Name",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text("How many pomodoros?",
                                style: AppTextStyle.captionMedium),
                            subtitle: Text("25 minutes each",
                                style: AppTextStyle.captionRegular),
                          ),
                          Row(
                            children: viewModel.pomodoroOptions
                                .map((e) => Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          viewModel.setselectedPomodoro(e);
                                        },
                                        child: Text("$e",
                                            style: AppTextStyle.captionMedium
                                                .copyWith(
                                                    color: viewModel
                                                                .selectedPomodoro ==
                                                            e
                                                        ? AppColors.accent
                                                        : AppColors.secondary)),
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              await viewModel.saveTodaysTasks().then((value) {
                                viewModel.toggleAddingTask();
                              });
                            },
                            child: Text("Add Task"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.todaysTasks.daysTasks.length,
                itemBuilder: (context, index) {
                  var task = viewModel.todaysTasks.daysTasks[index];
                  return Dismissible(
                    key: Key(task.id),
                    direction: DismissDirection
                        .endToStart, // Allow only right-to-left swipe
                    onDismissed: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        await viewModel.deleteTask(task);
                      }
                    },
                    background: Container(
                      color: AppColors.accent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.delete, color: AppColors.primary),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    child: ListTile(
                      title: Text(task.name, style: AppTextStyle.bodyMedium),
                      subtitle: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: task.pomodoros
                              .map((e) => GestureDetector(
                                    onTap: () {
                                      viewModel.completePomodoro(
                                          task, task.pomodoros.indexOf(e));
                                    },
                                    child: Icon(
                                      e.isCompleted
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      color: AppColors.accent,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              EditTaskRoute(
                                daysTasks: viewModel.todaysTasks,
                                taskId: task.id,
                              ).push(context).then((value) {
                                if (value == true) {
                                  viewModel.getTaskForToday();
                                }
                              });
                            },
                            icon:
                                Icon(Icons.more_vert, color: AppColors.accent),
                          ),
                          task.pomodoros.every((element) => element.isCompleted)
                              ? SizedBox.shrink()
                              : IconButton(
                                  onPressed: () {
                                    if (!task.pomodoros.every(
                                        (element) => element.isCompleted)) {
                                      PomodoroRoute(
                                        taskId: task.id,
                                        day: viewModel.todaysTasks.date,
                                      ).push(context).then((value) {
                                        if (value == true) {
                                          viewModel.completePomodoro(
                                            task,
                                            task.pomodoros.indexOf(
                                              task.pomodoros.firstWhere(
                                                (element) =>
                                                    !element.isCompleted,
                                              ),
                                            ),
                                          );
                                          viewModel.getTaskForToday();
                                        }
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.play_arrow,
                                      color: AppColors.accent),
                                ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
