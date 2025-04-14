import 'package:flutter/material.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormField.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAuthButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/signInCubit/cubit/sign_in_cubit.dart';

class LoginFormSection extends StatefulWidget {
  const LoginFormSection({super.key});

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool isPasswordObscure = true;
  String email = '', password = '';
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
          onChanged: (value) => email = value ?? '',
          onChanged2: (value) => password = value ?? '',
          isPasswordObscure: isPasswordObscure,
          onPressed: updateState,
        ),
        const SizedBox(height: 33),
        CustomAuthButton(
            title: "تسجيل الدخول",
            onPressed: () {
              context
                  .read<SignInCubit>()
                  .signInUserWithEmailAndPassword(email: email, password:password);
            }),
        const SizedBox(height: 10),
      ],
    );
  }
}
