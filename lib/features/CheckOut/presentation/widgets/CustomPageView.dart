import 'package:e_commerce/features/CheckOut/presentation/widgets/ShippingSection.dart';
import 'package:flutter/material.dart';

import 'AddressInputSection.dart';

import 'PaymentSection.dart';

class CheckOutStepsPageView extends StatelessWidget {
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final Function(int index) onPressed;
  final ValueNotifier<AutovalidateMode> autovalidateModeNotifier;

  const CheckOutStepsPageView(
      {super.key,
      required this.pageController,
      required this.formKey,
      required this.autovalidateModeNotifier,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: PageView.builder(
        onPageChanged: onPressed,
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return getPages()[index];
        },
      ),
    ));
  }

  List<Widget> getPages() {
    return [
      ShippingSection(),
      AddressInputSection(
        formKey: formKey,
        autovalidateModeNotifier: autovalidateModeNotifier,
      ),
      PaymentSection(
        pageController: pageController,
      ),
    ];
  }
}
