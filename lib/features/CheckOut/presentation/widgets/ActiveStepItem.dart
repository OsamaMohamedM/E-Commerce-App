import 'package:e_commerce/Core/utils/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';

class ActiveStepItem extends StatelessWidget {
  final String text;
  const ActiveStepItem({super.key ,required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.darkPrimaryColor,
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 17,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
        text,
          style: TextStyles.bold13.copyWith(color: AppColors.darkPrimaryColor),
        )
      ],
    );
  }
}
