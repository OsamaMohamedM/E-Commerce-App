import 'package:flutter/material.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormField.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAuthButton.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool isPasswordObscure = true;
  
  void updateState() {
    setState(() {
      isPasswordObscure = !isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarAuth(title: "تسجيل الدخول", onPress: () {}),
        const SizedBox(height: 24),
        CustomTextFormField(
          isPasswordObscure: isPasswordObscure,
          
          onPressed: updateState,
        ),
        const SizedBox(height: 33),
        CustomAuthButton(title: "تسجيل الدخول", onPressed: () {}),
        const SizedBox(height: 10),
      ],
    );
  }
}
