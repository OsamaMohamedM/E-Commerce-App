import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/CheckOut/presentation/widgets/CheckOutSteps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utils/widgets/CustomButton.dart';
import '../../Data/models/Order.dart';
import 'CustomPageView.dart';

class CheckOutViewBody extends StatefulWidget {
  const CheckOutViewBody({super.key});

  @override
  State<CheckOutViewBody> createState() => _CheckOutViewBodyState();
}

class _CheckOutViewBodyState extends State<CheckOutViewBody> {
  late PageController pageController;
  @override
  void initState() {
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0 ,vertical: 30),
      child: Column(
        children: [
          CustomAppBar(tittle: 'الشحن'),
          const SizedBox(height: 16,),
          CheckOutSteps(
            pageController: pageController,
            currentIndex: currentIndex,
          ),
          SizedBox(height: 10),
          CheckOutStepsPageView(
            controller: pageController,
          ),
        
          CustomButton(
              buttonName: getNextButtonText(),
              onPressed: () {
                if(context.read<Order>().payWithCash!=null) {
                  pageController.animateToPage(currentIndex + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn);
                }else
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('يرجي تحديد طريقه الدفع')));
                }
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
