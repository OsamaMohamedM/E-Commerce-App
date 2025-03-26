import 'package:flutter/material.dart';

import 'ShippingItem.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          price: "40 جنيه",
          subTitle: 'التسليم في المكان',
          title: 'الدفع عند الاستلام',
          isSelected: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        ShippingItem(
          price: "40 جنيه",
          subTitle: 'يرجي تحديد طريقه الدفع',
          title: 'الدفع اونلاين',
          isSelected: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
      ],
    );
  }
}
