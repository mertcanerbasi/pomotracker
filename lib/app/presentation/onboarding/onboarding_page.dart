import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/onboarding/onboarding.vm.dart';
import 'package:pomotracker/app/presentation/onboarding/widget/onboarding_widget.dart';
import 'package:pomotracker/app/router/app_router.routes.dart';
import 'package:pomotracker/core/base/base_widget.dart';
import 'package:pomotracker/core/res/color.dart';
import 'package:pomotracker/core/res/text_styles.dart';

import 'package:route_map/route_map.dart';

@RouteMap()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends BaseState<OnboardingViewModel, OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              await viewModel.setOnBoarded();
              SplashRoute().pushReplacement(context);
            },
            child: Text(
              "Atla",
              style: AppTextStyle.captionRegular.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColors.secondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      //Slidable 4 steps onboarding
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: OnboardingWidget(
            page: viewModel.currentPage,
            onContinue: () async {
              if (viewModel.currentPage < 4) {
                viewModel.setcurrentPage(viewModel.currentPage + 1);
              } else {
                await viewModel.setOnBoarded();
                SplashRoute().pushReplacement(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
