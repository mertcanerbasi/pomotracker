import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pomotracker/app/presentation/home/home_page.vm.dart';
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
              5.verticalSpace,
              ListTile(
                title: Text("Today", style: AppTextStyle.bodyMedium),
                subtitle: Text(date, style: AppTextStyle.captionRegular),
                trailing: Text("${viewModel.taskCount ?? 0}",
                    style: AppTextStyle.bodyMedium),
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: viewModel.isAddingTask ? 200.h : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    child: ListView(
                      children: [
                        TextField(
                          style: AppTextStyle.captionMedium,
                          controller: viewModel.taskNameController,
                          decoration: InputDecoration(
                            labelText: "Task Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
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
                                              BorderRadius.circular(8.r),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await viewModel.saveTodaysTasks().then((value) {
                              viewModel.toggleAddingTask();
                            });
                          },
                          child: Text("Add Task"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ],
                    ),
                  )),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.todaysTasks.daysTasks.length,
                itemBuilder: (context, index) {
                  var task = viewModel.todaysTasks.daysTasks[index];
                  return ListTile(
                    title: Text(task.name, style: AppTextStyle.bodyMedium),
                    subtitle: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
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
                    trailing:
                        task.pomodoros.every((element) => element.isCompleted)
                            ? Icon(
                                Icons.check,
                                color: AppColors.accent,
                              )
                            : SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
