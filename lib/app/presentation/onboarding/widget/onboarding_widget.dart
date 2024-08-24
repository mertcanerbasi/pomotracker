import 'package:flutter/material.dart';
import 'package:pomotracker/app/presentation/onboarding/widget/dots_indicator.dart';
import 'package:pomotracker/core/res/color.dart';
import 'package:pomotracker/core/res/images.dart';
import 'package:pomotracker/core/res/text_styles.dart';

class OnboardingWidget extends StatelessWidget {
  final VoidCallback onContinue;
  final int page;

  const OnboardingWidget(
      {Key? key, required this.onContinue, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Variables to hold different images and texts based on the page number
    late String imagePath;
    late String title;
    late String description;

    // Determine content based on the page number
    switch (page) {
      case 1:
        imagePath = AppImages.background;
        title = "Deneme";
        description = "Açıklama 1";
        break;
      case 2:
        imagePath = AppImages.background;
        title = "Deneme 2";
        description = "Açıklama 2";

        break;
      case 3:
        imagePath = AppImages.background;
        title = "Deneme 3";
        description = "Açıklama 3";
        break;
      case 4:
        imagePath = AppImages.background;
        title = "Deneme 4";
        description = "Açıklama 4";
        break;
      default:
        // Handle default case, if needed
        imagePath = 'assets/images/background.png';
        title = "Default Title";
        description = "Default description text.";
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.subheadingMedium.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyle.bodyRegular,
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            onContinue.call();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
          ),
          child: Text(
            "Devam Et",
            style: AppTextStyle.button.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 50),
        // 4 dots indicator
        DotsIndicator(
          currentPage: page,
          totalPages: 4,
        ),
      ],
    );
  }
}
