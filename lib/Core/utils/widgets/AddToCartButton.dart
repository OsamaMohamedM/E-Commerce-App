import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.darkPrimaryColor,
      child: Icon(Icons.add, color: Colors.white),
    );
  }
}
