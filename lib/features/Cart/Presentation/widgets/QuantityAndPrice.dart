import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import '../../../../Core/utils/widgets/AddToCartButton.dart';

class QuantityAndPrice extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityAndPrice({
    super.key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AddToCartButton(icon: Icons.add, onTap: onIncrement),
        const SizedBox(width: 5),
        Text('$counter', style: TextStyles.bold16),
        const SizedBox(width: 5),
        AddToCartButton(icon: Icons.remove, onTap: onDecrement),
        const Spacer(),
        Text('60 جنيه',
            style: TextStyles.bold16.copyWith(color: AppColors.myAmberColor)),
      ],
    );
  }
}

