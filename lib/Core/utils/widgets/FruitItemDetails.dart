import 'package:e_commerce/Core/utils/widgets/FruitItemName.dart';
import 'package:flutter/material.dart';

import '../../Data/Model/Product.dart';
import 'AddToCartButton.dart';

class FruitItemDetails extends StatelessWidget {
  final Product product;
  const FruitItemDetails({required this.product,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FruitItemName(product : product),
        const Spacer(),
        AddToCartButton(onTap: (){},),
      ],
    );
  }
}
