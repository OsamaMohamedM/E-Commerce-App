import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final Widget trialing;
  final Function() onTap;
  const CustomListTile({
    super.key,
    required this.title,
    required this.leading,
    required this.onTap,
    this.trialing = const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.darkPrimaryColor,
      )
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(
        title,
        style: TextStyles.semiBold13,
      ),
      trailing: trialing,
    );
  }
}

