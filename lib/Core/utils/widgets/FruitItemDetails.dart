import 'package:e_commerce/Core/utils/widgets/FruitItemName.dart';
import 'package:flutter/material.dart';

import 'AddToCartButton.dart';

class FruitItemDetails extends StatelessWidget {
  const FruitItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FruitItemName(),
        const Spacer(),
        AddToCartButton(),
      ],
    );
  }
}
