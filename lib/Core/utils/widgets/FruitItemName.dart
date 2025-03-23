import 'package:flutter/material.dart';

import '../../Data/Model/Product.dart';
import '../styles/app_colors.dart';
import '../styles/textStyles.dart';

class FruitItemName extends StatelessWidget {
  final Product product;
  const FruitItemName({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style: TextStyles.semiBold13),
        const SizedBox(
          height: 4,
        ),
        Text.rich(
          TextSpan(
            text: product.price.toString(),
            style: TextStyles.bold13.copyWith(color: AppColors.myAmberColor),
            children: [
              TextSpan(
                text: 'الكيلو',
                style: TextStyles.regular13.copyWith(
                  color: Color(0xFFF4A91F),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
