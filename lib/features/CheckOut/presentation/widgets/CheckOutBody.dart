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
  void init()
  {
    pageController = PageController(initialPage: 0);
    super.initState();
  }
  @override
  void dispose()
  {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Column(
        children: [
          CustomAppBar(tittle: 'الشحن'),
          CheckOutSteps(),
          SizedBox(height :10),
          CheckOutStepsPageView(controller: pageController,),
          Spacer(),
          CustomButton(buttonName: "التالي", onPressed: () {
            pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastLinearToSlowEaseIn);
          })
        ],
      ),
    );
  }
}
