import 'package:flutter/material.dart';

import '../../Data/Model/ProductEntity.dart';
import '../styles/app_colors.dart';
import '../styles/textStyles.dart';

class FruitItemName extends StatelessWidget {
  final ProductEntity product;
  final TextStyle textStyle;
  const FruitItemName({required this.product, super.key , this.textStyle =TextStyles.semiBold13 });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style:textStyle),
        const SizedBox(
          height: 4,
        ),
        Text.rich(
          TextSpan(
            text: ' ${product.price} ',
            style: TextStyles.bold13.copyWith(color: AppColors.myAmberColor),
            children: [
              TextSpan(
                text: 'الكيلو ',
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
