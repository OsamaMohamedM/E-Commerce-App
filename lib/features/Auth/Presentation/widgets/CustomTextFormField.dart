import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   final void Function(String?)? onChanged;
   final void Function(String?)? onChanged2;
  const CustomTextFormField({
    super.key,
    required this.isPasswordObscure,
    required this.onPressed, this.onChanged, this.onChanged2,
  });
  final VoidCallback onPressed;
  final bool isPasswordObscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiledItem(
            onChanged: onChanged,
            onPressed: onPressed,
            isObscure: false,
            isPassword: false,
            hint: "البريد الالكتروني"),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormFiledItem(
            onChanged: onChanged2,
            onPressed: onPressed,
            isObscure: isPasswordObscure,
            isPassword: true,
            hint: "كلمة المرور"),
      ],
    );
  }
}
