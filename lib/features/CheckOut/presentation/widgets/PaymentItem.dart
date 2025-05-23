import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/utils/styles/textStyles.dart';
import '../../cubits/checkOutCubit/cubit/check_out_cubit.dart';
import 'AddressDetails.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final Widget child;
  final PageController pageController;
  const PaymentItem(
      {super.key,
      required this.title,
      required this.child,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    final order  = context.read<CheckOutCubitCubit>().orderEntity;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyles.bold13,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
          child: child,
        ),
        const SizedBox(
          height: 8,
        ),
        AddressDetails(
          address: order.shippingAddress!.toString(),
          onPressed: () {
            pageController.jumpToPage(pageController.page!.toInt() - 1);
          },
        ),
      ],
    );
  }
}
