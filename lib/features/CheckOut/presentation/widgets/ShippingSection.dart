import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/Order.dart';
import 'ShippingItem.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          price:
              "${context.read<OrderEntity>().cartEntity.clcTotal() + 40}جنيه",
          subTitle: 'التسليم في المكان',
          title: 'الدفع عند الاستلام',
          isSelected: selectedIndex == 0,
          onTap: () {
            context.read<OrderEntity>().payWithCash = true;
            setState(() {
              selectedIndex = 0;
            });
            log(context.read<OrderEntity>().payWithCash.toString());
          },
        ),
        const SizedBox(
          height: 16,
        ),
        ShippingItem(
          price: "${context.read<OrderEntity>().cartEntity.clcTotal()} جنيه",
          subTitle: 'يرجي تحديد طريقه الدفع',
          title: 'الدفع اونلاين',
          isSelected: selectedIndex == 1,
          onTap: () {
            context.read<OrderEntity>().payWithCash = false;
            setState(() {
              selectedIndex = 1;
            });
            log(context.read<OrderEntity>().payWithCash.toString());
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
