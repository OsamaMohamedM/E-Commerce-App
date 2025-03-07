import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.num,
    required this.currentPage,
  });

  final int num;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: num,
      decorator: DotsDecorator(
        activeColor: AppColors.darkPrimaryColor,
        color: (currentPage == 1
            ? AppColors.darkPrimaryColor
            : AppColors.darkPrimaryColor.withOpacity(0.5)),
      ),
    );
  }
}
