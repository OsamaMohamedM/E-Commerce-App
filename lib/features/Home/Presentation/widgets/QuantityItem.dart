import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/textStyles.dart';
import '../../../../Core/utils/widgets/AddToCartButton.dart';

class QuantityItem extends StatelessWidget {
  const QuantityItem({
    super.key,
    required this.onIncrement,
    required this.counter,
    required this.onDecrement,
  });

  final VoidCallback onIncrement;
  final int counter;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddToCartButton(icon: Icons.add, onTap: onIncrement),
    const SizedBox(width: 5),
    Text('$counter', style: TextStyles.bold16),
    const SizedBox(width: 5),
    AddToCartButton(icon: Icons.remove, onTap: onDecrement),
      ],
    );
  }
}
