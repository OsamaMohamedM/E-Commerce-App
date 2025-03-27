import 'package:flutter/material.dart';
import 'StepItem.dart';

class CheckOutSteps extends StatelessWidget {
  final int currentIndex;
  final PageController pageController;
  const CheckOutSteps(
      {super.key, required this.currentIndex, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(getSteps().length, (index) {
      return Expanded(
          child: GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              }, 
              child: StepItem(isActive: currentIndex >= 0)));
    }));
  }
}

getSteps() {
  return [
    '',
    '',
    '',
  ];
}
