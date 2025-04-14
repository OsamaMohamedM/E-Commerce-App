import 'package:e_commerce/Core/utils/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';

class InActiveStepItem extends StatelessWidget {
  final String title;
  final String number;
  const InActiveStepItem({super.key, required this.title , required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.grayTextColor,
          child:  Text(
            number,
            style: TextStyles.semiBold13,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: TextStyles.semiBold13.copyWith(color: Color(0xffAAAAAA)),
        )
      ],
    );
  }
}
