import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pomotracker/app/presentation/pomodoro/pomodoro_page.vm.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:pomotracker/core/util/widget_ex.dart';
import 'package:route_map/route_map.dart';

@RouteMap()
class PomodoroPage extends StatefulWidget {
  final String taskId;
  final String day;
  const PomodoroPage({Key? key, required this.taskId, required this.day})
      : super(key: key);

  @override
  _PomodoroState createState() => _PomodoroState();
}

class _PomodoroState extends BaseState<PomodoroViewModel, PomodoroPage> {
  @override
  void initState() {
    super.initState();
    viewModel.init(widget.taskId, widget.day);
    endFrame((p0) async {
      viewModel.isPomodoroCompleted.listen((isCompleted) {
        if (isCompleted) {
          Navigator.pop(context, true);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pomodoro'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formatDuration(viewModel.timeElapsed),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    20.verticalSpace,
                    Text("Get to work!", textAlign: TextAlign.center),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: viewModel.isTimerRunning
                    ? viewModel.endTimer
                    : viewModel.startTimer,
                child: Text(
                    viewModel.isTimerRunning ? 'Finish Timer' : 'Start Timer'),
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}
