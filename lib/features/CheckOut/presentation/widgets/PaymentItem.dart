import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utils/styles/textStyles.dart';
import '../../Data/models/Order.dart';
import 'AddressDetails.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final Widget child;
  const PaymentItem({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const SizedBox(
              height: 8,
            ),
            Text(title, style: TextStyles.bold13,),
            const SizedBox(
              height: 8,
            ),
            Container(
                decoration: ShapeDecoration(
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),)
                     ),
                     child: child,
            ),
            const SizedBox(
              height: 8,
            ),
            AddressDetails(address: context.read<Order>().shippingAddress!.toString(),),
        ],
    );
  }
}

