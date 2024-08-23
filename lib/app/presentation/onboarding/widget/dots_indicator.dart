import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pomotracker/core/res/color.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const DotsIndicator({
    Key? key,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];

    for (int i = 0; i < totalPages; i++) {
      // Determine color and size based on whether it's the current page
      Color color = i == currentPage - 1
          ? AppColors.secondary
          : AppColors.secondary.withOpacity(0.5);
      double size = i == currentPage - 1 ? 8.w : 6.w;

      dots.add(Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ));

      // Add horizontal space between dots, except after the last dot
      if (i < totalPages - 1) {
        dots.add(SizedBox(width: 5.w));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }
}
