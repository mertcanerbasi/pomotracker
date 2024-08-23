// Flutter imports:

import 'package:flutter/material.dart';
import 'package:pomotracker/core/base/base_view_model.dart';
import 'package:pomotracker/core/di/locator.dart';

class ViewModelBuilder<T extends BaseViewModel> extends StatelessWidget {
  const ViewModelBuilder(
      {super.key, required this.builder, required this.viewModel});
  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, value) {
        return builder(context, viewModel);
      },
    );
  }
}

abstract class BaseState<T extends BaseViewModel, P extends StatefulWidget>
    extends State<P> {
  T viewModel = getIt<T>();

  @override
  void initState() {
    viewModel.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();

    super.dispose();
  }
}
