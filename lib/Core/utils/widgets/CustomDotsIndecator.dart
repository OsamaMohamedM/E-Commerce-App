import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.num,
  });

  final int num;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: num,
      decorator: DotsDecorator(
        activeColor: AppColors.primaryColor,
        color: AppColors.primaryColor.withOpacity(0.5),
      ),
    );
  }
}
