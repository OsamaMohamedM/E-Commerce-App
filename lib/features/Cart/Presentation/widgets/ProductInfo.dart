import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('بطيخ', style: TextStyles.bold13),
            Text(
              '3 كم',
              style:
                  TextStyles.regular13.copyWith(color: AppColors.myAmberColor),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {},
        ),
      ],
    );
  }
}

