import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/textStyles.dart';

class ProductViewHeader extends StatelessWidget {
  final int productLength;
  const ProductViewHeader({
    required this.productLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$productLength نتائج',
          style: TextStyles.bold16.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
