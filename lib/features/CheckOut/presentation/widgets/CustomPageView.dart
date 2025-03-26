import 'package:e_commerce/features/CheckOut/presentation/widgets/ShippingSection.dart';
import 'package:flutter/material.dart';

class CheckOutStepsPageView extends StatelessWidget {
  PageController controller;
  CheckOutStepsPageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView.builder(
                controller: controller,
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
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];
  }
}
