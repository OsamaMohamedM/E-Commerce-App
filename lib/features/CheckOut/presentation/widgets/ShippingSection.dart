import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/Order.dart';
import 'ShippingItem.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          price: "${context.read<Order>().cartEntity.clcTotal() + 40}جنيه",
          subTitle: 'التسليم في المكان',
          title: 'الدفع عند الاستلام',
          isSelected: selectedIndex == 0,
          onTap: () {
            context.read<Order>().payWithCash = true;
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          price: "${context.read<Order>().cartEntity.clcTotal()} جنيه",
          subTitle: 'يرجي تحديد طريقه الدفع',
          title: 'الدفع اونلاين',
          isSelected: selectedIndex == 1,
          onTap: () {
            context.read<Order>().payWithCash = false;
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
      ],
    );
  }
}
