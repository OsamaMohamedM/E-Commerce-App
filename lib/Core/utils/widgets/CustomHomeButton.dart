import 'package:e_commerce/Core/utils/styles/textStyles.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });
  final String buttonName;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: onPressed,
          child: FittedBox(
            child: Text(buttonName,
                textAlign: TextAlign.center,
                style: TextStyles.bold16
                    .copyWith(color: AppColors.lightPrimaryColor)),
          )),
    );
  }
}
