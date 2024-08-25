import 'package:flutter/material.dart';
import 'package:pomotracker/app/model/task.dart';
import 'package:pomotracker/app/presentation/edit_task/edit_task.vm.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:pomotracker/core/res/color.dart';
import 'package:pomotracker/core/res/text_styles.dart';
import 'package:route_map/route_map.dart';

@RouteMap(fullScreenDialog: true)
class EditTaskPage extends StatefulWidget {
  final DaysTask daysTasks;
  final String taskId;
  const EditTaskPage({Key? key, required this.daysTasks, required this.taskId})
      : super(key: key);
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends BaseState<EditTaskViewModel, EditTaskPage> {
  @override
  void initState() {
    viewModel.init(widget.taskId, widget.daysTasks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit",
          style: AppTextStyle.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: viewModel.taskNameController,
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: "Task Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              //Number of pomodoros
              Row(
                children: [
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: viewModel.isAddButtonEnabled
                        ? () {
                            viewModel.daysTasks.daysTasks
                                .where(
                                    (element) => element.id == viewModel.taskId)
                                .first
                                .pomodoros
                                .add(Pomodoro(isCompleted: false));
                            viewModel.notifyListeners();
                          }
                        : null,
                    icon: Icon(Icons.add),
                  ),
                  Spacer(),
                  Text("Pomodoros", style: AppTextStyle.bodyMedium),
                  Spacer(),
                  IconButton(
                    onPressed: viewModel.isRemoveButtonEnabled
                        ? () {
                            viewModel.daysTasks.daysTasks
                                .where(
                                    (element) => element.id == viewModel.taskId)
                                .first
                                .pomodoros
                                .removeLast();
                            viewModel.notifyListeners();
                          }
                        : null,
                    icon: Icon(Icons.remove),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: viewModel.daysTasks.daysTasks
                      .where((element) => element.id == viewModel.taskId)
                      .first
                      .pomodoros
                      .map((e) {
                    return IconButton(
                      onPressed: () {
                        viewModel.daysTasks.daysTasks
                            .where((element) => element.id == viewModel.taskId)
                            .first
                            .pomodoros
                            .remove(e);
                        viewModel.notifyListeners();
                      },
                      icon: Icon(
                        Icons.circle_outlined,
                        color: AppColors.secondary,
                      ),
                    );
                  }).toList()),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  await viewModel.saveTask().then((value) {
                    Navigator.pop(context, true);
                  });
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
