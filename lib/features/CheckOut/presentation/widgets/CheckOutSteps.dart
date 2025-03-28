import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Data/models/Order.dart';
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
                if (context.read<OrderEntity>().payWithCash != null) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('يرجي تحديد طريقه الدفع')));
                }
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
