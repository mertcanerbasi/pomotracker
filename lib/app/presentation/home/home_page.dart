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
  Widget build(BuildContext context) {
    var date = DateFormat.yMEd().format(DateTime.now());
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
                  height: viewModel.isAddingTask ? 160.h : 0,
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
                          decoration: InputDecoration(
                            hintText: "Task Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                        8.verticalSpace,
                        TextField(
                          style: AppTextStyle.captionMedium,
                          decoration: InputDecoration(
                            hintText: "Task Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                          ),
                        ),
                        16.verticalSpace,
                        ElevatedButton(
                          onPressed: () {
                            // Implement your add task functionality here
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
