import 'package:e_commerce/features/Auth/Login/Presentation/widgets/CustomTextFormFiledItem.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles/textStyles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.isPasswordObscure,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;
  final bool isPasswordObscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiledItem(
            onPressed: onPressed,
            isObscure: isPasswordObscure,
            controller: emailController,
            isPassword: false,
            title: "البريد الالكتروني"),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormFiledItem(
            onPressed: onPressed,
            isObscure: isPasswordObscure,
            controller: passwordController,
            isPassword: true,
            title: "كلمة المرور"),
        Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "نسيت كلمة المرور؟",
                style: TextStyles.semiBold13,
              ),
            )),
      ],
    );
  }
}
