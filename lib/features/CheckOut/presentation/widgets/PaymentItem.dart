import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/textStyles.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final Widget child;
  const PaymentItem({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
            Text(title, style: TextStyles.semiBold13,),
            const SizedBox(
              height: 8,
            ),
            Container(
                decoration: ShapeDecoration(
                    color:const Color(0x7FF2f3F3),
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),)
                     ),
                     child: child,
            )
        ],
    );
  }
}
