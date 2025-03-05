import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CustomTermsAndConditionsText extends StatelessWidget {
  const CustomTermsAndConditionsText({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;
  
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: title,
          style:
              TextStyles.semiBold13.copyWith(color: AppColors.grayTextColor),
          children: [
            TextSpan(
                text: subtitle,
                style: TextStyles.bold13
                    .copyWith(color: AppColors.lightPrimaryColor))
          ]),
      overflow: TextOverflow.visible,
    );
  }
}
