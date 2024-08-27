import 'package:flutter/material.dart';
import 'package:pomotracker/app/model/task.dart';
import 'package:pomotracker/app/presentation/history/history_page.vm.dart';
import 'package:pomotracker/app/router/app_router.routes.dart';
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
        child: StreamBuilder<List<DaysTask?>>(
          stream: viewModel.tasksStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text("History", style: AppTextStyle.headlineMedium),
                      Spacer(),
                    ],
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
            if (snapshot.hasError) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text("History", style: AppTextStyle.headlineMedium),
                      Spacer(),
                    ],
                  ),
                  Center(child: Text('A problem occurred')),
                ],
              );
            } else {
              if (snapshot.data
                      ?.where((element) => element?.date != viewModel.today)
                      .isEmpty ??
                  true) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text("History", style: AppTextStyle.headlineMedium),
                        Spacer(),
                      ],
                    ),
                    ListTile(
                      title: Text("No tasks history"),
                      subtitle: Text(
                          "You have not completed or created any tasks yet"),
                      trailing: Icon(Icons.sentiment_dissatisfied),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text("History", style: AppTextStyle.headlineMedium),
                        Spacer(),
                        viewModel.isFiltered
                            ? IconButton(
                                onPressed: () {
                                  viewModel.toggleFilter();
                                },
                                icon: Icon(Icons.clear),
                              )
                            : IconButton(
                                onPressed: () async {
                                  viewModel.toggleFilter();
                                },
                                icon: Icon(Icons.search),
                              ),
                      ],
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: viewModel.isFiltered ? 80 : 0,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Center(
                          child: TextField(
                            controller: viewModel.searchController,
                            onSubmitted: (value) {
                              viewModel.filterTasks(value, snapshot.data);
                            },
                            decoration: InputDecoration(
                              hintText: "Search",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (viewModel.isFiltered)
                      Expanded(
                        child: Column(
                          children: [
                            if (viewModel.filteredTasks?.isEmpty == true ||
                                viewModel.filteredTasks == null)
                              ListTile(
                                title: Text("No tasks"),
                                subtitle:
                                    Text("No tasks found for this search"),
                              ),
                            Expanded(
                              child: ListView.builder(
                                itemCount:
                                    viewModel.filteredTasks?.reversed.length ??
                                        0,
                                itemBuilder: (context, index) {
                                  var reversedData = viewModel
                                      .filteredTasks?.reversed
                                      .toList()[index];
                                  var date = reversedData?.date;
                                  var totalPomodoros = reversedData?.daysTasks
                                      .fold(
                                          0,
                                          (prev, task) =>
                                              (prev) + task.pomodoros.length);
                                  var tasks = reversedData?.daysTasks ?? [];

                                  return ExpansionTile(
                                    title: Text(
                                      "Date",
                                      style: AppTextStyle.bodyMedium,
                                    ),
                                    subtitle: Text(
                                      date ?? '',
                                      style: AppTextStyle.captionRegular,
                                    ),
                                    trailing: Text(
                                      "${totalPomodoros ?? 0}",
                                      style: AppTextStyle.bodyMedium,
                                    ),
                                    dense: true,
                                    children: tasks.map((task) {
                                      return ListTile(
                                        onTap: () => EditTaskRoute(
                                          daysTasks: reversedData!,
                                          taskId: task.id,
                                        ).push(context),
                                        leading: task.pomodoros.every(
                                                (pomodoro) =>
                                                    pomodoro.isCompleted)
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
                                          "${task.name}", // Assuming task.title exists
                                        ),
                                        trailing: task.pomodoros.every(
                                                (pomodoro) =>
                                                    pomodoro.isCompleted)
                                            ? null
                                            : Container(
                                                width: 100,
                                                height: 20,
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: AppColors.accent
                                                      .withOpacity(0.05),
                                                ),
                                                child: Row(
                                                  children: [
                                                    ...task.pomodoros
                                                        .map((pomodoro) {
                                                      if (pomodoro
                                                          .isCompleted) {
                                                        return Expanded(
                                                          child: Container(
                                                            color: AppColors
                                                                .accent,
                                                          ),
                                                        );
                                                      } else {
                                                        return Spacer();
                                                      }
                                                    }).toList(),
                                                  ],
                                                )),
                                        subtitle: Text(
                                          "${task.pomodoros.length} pomodoros",
                                        ),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (!viewModel.isFiltered)
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.reversed
                                  .where(
                                    (element) =>
                                        element?.date != viewModel.today,
                                  )
                                  .toList()
                                  .length ??
                              0,
                          itemBuilder: (context, index) {
                            var reversedData = snapshot.data?.reversed
                                .toList()
                                .where(
                                  (element) => element?.date != viewModel.today,
                                )
                                .toList()[index];
                            var date = reversedData?.date;
                            var totalPomodoros = reversedData?.daysTasks.fold(0,
                                (prev, task) => (prev) + task.pomodoros.length);
                            var tasks = reversedData?.daysTasks ?? [];

                            return ExpansionTile(
                              title: Text(
                                "Date",
                                style: AppTextStyle.bodyMedium,
                              ),
                              subtitle: Text(
                                date ?? '',
                                style: AppTextStyle.captionRegular,
                              ),
                              trailing: Text(
                                "${totalPomodoros ?? 0}",
                                style: AppTextStyle.bodyMedium,
                              ),
                              dense: true,
                              children: tasks.map((task) {
                                return ListTile(
                                  leading: task.pomodoros.every(
                                          (pomodoro) => pomodoro.isCompleted)
                                      ? Icon(
                                          Icons.check,
                                          size: 20,
                                          color: AppColors.accent,
                                        )
                                      : Icon(
                                          Icons.radio_button_unchecked,
                                          size: 20,
                                        ),
                                  onTap: () {
                                    EditTaskRoute(
                                      daysTasks: reversedData!,
                                      taskId: task.id,
                                    ).push(context);
                                  },
                                  title: Text(
                                    "${task.name}", // Assuming task.title exists
                                  ),
                                  trailing: task.pomodoros.every(
                                          (pomodoro) => pomodoro.isCompleted)
                                      ? null
                                      : Container(
                                          width: 100,
                                          height: 20,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.accent
                                                .withOpacity(0.05),
                                          ),
                                          child: Row(
                                            children: [
                                              ...task.pomodoros.map((pomodoro) {
                                                if (pomodoro.isCompleted) {
                                                  return Expanded(
                                                    child: Container(
                                                      color: AppColors.accent,
                                                    ),
                                                  );
                                                } else {
                                                  return Spacer();
                                                }
                                              }).toList(),
                                            ],
                                          )),
                                  subtitle: Text(
                                    "${task.pomodoros.length} pomodoros",
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        ),
                      ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
