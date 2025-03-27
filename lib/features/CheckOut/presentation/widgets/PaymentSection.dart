import 'package:flutter/material.dart';
import 'CustomOrderSummary.dart';

class PaymentSection extends StatelessWidget {
const PaymentSection({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomOrderSummary()
      ],
    );
  }
}

