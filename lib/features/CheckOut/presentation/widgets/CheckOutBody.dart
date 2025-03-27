import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/CheckOut/presentation/widgets/CheckOutSteps.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/widgets/CustomButton.dart';
import 'CustomPageView.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  void init() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomAppBar(tittle: 'الشحن'),
          CheckOutSteps(
            pageController: pageController,
            currentIndex: currentIndex,
          ),
          SizedBox(height: 10),
          CheckOutStepsPageView(
            controller: pageController,
          ),
          Spacer(),
          CustomButton(
              buttonName: getNextButtonText(),
              onPressed: () {
                pageController.animateToPage(currentIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn);
              })
        ],
      ),
    );
  }

  String getNextButtonText() {
    switch (currentIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }
}
