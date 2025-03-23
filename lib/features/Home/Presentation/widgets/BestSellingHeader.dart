import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/textStyles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold16.copyWith(color: Colors.black),
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            'المزيد',
            style: TextStyles.semiBold13.copyWith(color: Colors.white24),
          ),
        ),
      ],
    );
  }
}
