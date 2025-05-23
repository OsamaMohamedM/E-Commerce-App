import 'package:flutter/material.dart';
import 'StepItem.dart';

class CheckOutSteps extends StatelessWidget {
  final int currentIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;
  const CheckOutSteps(
      {super.key,
      required this.currentIndex,
      required this.pageController,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(getSteps().length, (index) {
      return Expanded(
          child: GestureDetector(
              onTap: () {
                onTap(index);
              },
              child: StepItem( number: (index+1).toString() ,  title: getSteps()[index], isActive: currentIndex >= index)));
    }));
  }
}

getSteps() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}
