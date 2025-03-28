import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.isPasswordObscure,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final bool isPasswordObscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiledItem(
           
            onPressed: onPressed,
            isObscure: isPasswordObscure,
            isPassword: false,
            title: "البريد الالكتروني"),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormFiledItem(
            onPressed: onPressed,
            isObscure: isPasswordObscure,
            isPassword: true,
            title: "كلمة المرور"),

      ],
    );
  }
}
