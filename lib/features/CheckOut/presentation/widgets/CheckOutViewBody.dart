import 'dart:developer';

import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/CheckOut/presentation/widgets/CheckOutSteps.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Core/Services/Payment.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> autovalidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);
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
    autovalidateModeNotifier.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: Column(
        children: [
          CustomAppBar(tittle: 'الشحن'),
          const SizedBox(
            height: 16,
          ),
          CheckOutSteps(
            onTap: (index) {
              if (index == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastLinearToSlowEaseIn);
              } else if (index == 1) {
                var ordderEntity = context.read<OrderEntity>();
                if (ordderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.fastLinearToSlowEaseIn);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('اختر طريقة الدفع'),
                    ),
                  );
                }
              } else {
                AddressFormValidate(context);
              }
            },
            pageController: pageController,
            currentIndex: currentIndex,
          ),
          SizedBox(height: 10),
          CheckOutStepsPageView(
            onPressed: (int val) {
              currentIndex = val;
            },
            autovalidateModeNotifier: autovalidateModeNotifier,
            formKey: formKey,
            pageController: pageController,
          ),
          CustomButton(
              buttonName: getNextButtonText(),
              onPressed: () {
                log(context.read<OrderEntity>().payWithCash.toString());
                if (currentIndex == 0) {
                  ShippingSectionValidate(context);
                } else if (currentIndex == 1) {
                  AddressFormValidate(context);
                } else {
                  final order = context.read<OrderEntity>();
                  Payment(orderEntity: order).handlePayment(context);
                }
              })
        ],
      ),
    );
  }

  void AddressFormValidate(BuildContext context) {
    if (formKey.currentState!.validate()) {
      pageController.animateToPage(currentIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('يرجي ادخال بيانات العنوان بشكل صحيح')));
    }
  }

  void ShippingSectionValidate(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(currentIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجي اختيار طريقة الدفع'),
        ),
      );
      autovalidateModeNotifier.value = AutovalidateMode.always;
    }
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
