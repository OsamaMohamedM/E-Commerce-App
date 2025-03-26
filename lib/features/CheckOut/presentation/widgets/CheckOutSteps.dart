import 'package:flutter/material.dart';
import 'StepItem.dart';

class CheckOutSteps extends StatelessWidget {
const CheckOutSteps({ super.key });

  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Expanded(child: StepItem(isActive: true)),
        Expanded(child: StepItem(isActive: false,)),
        Expanded(child: StepItem(isActive: false,)),
        Expanded(child: StepItem(isActive: false,)),
      ],
    );
  }
}