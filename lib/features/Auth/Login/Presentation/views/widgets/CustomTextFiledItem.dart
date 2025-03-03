import 'package:flutter/material.dart';

import '../../../../../../Core/utils/styles/textStyles.dart';

class CustomTextFiledItem extends StatelessWidget {
  const CustomTextFiledItem({
    super.key,
    required this.title,
    required this.controller,
    this.isObscure = false,
    this.isPassword = false,
    required this.onPressed,
  });

  final String title;
  final bool isObscure;
  final bool isPassword;
  final TextEditingController controller;
   final VoidCallback onPressed; 
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? IconButton(
                icon: isObscure
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.visibility_off),
                onPressed: onPressed,
              )
            : null,
        hintText: title,
        hintStyle: TextStyles.bold13,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.black38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(width: 1, color: Colors.black38),
        ),
      ),
    );
  }
}
