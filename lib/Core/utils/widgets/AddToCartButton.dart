import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  final IconData icon;
  final void Function() onTap;
  const AddToCartButton({super.key, this.icon = Icons.add , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.darkPrimaryColor,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
