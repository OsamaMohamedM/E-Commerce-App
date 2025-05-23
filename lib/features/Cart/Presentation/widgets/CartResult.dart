import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CartResult extends StatelessWidget {
  final int num;
  const CartResult({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.customTextFieldBorder,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          'لديك $num منتجات في السلة',
          style: TextStyles.regular13,
        ),
      ),
    );
  }
}
