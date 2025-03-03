import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:e_commerce/features/Auth/Login/Presentation/views/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import '../../../../../../Core/utils/styles/textStyles.dart';
import 'CustomAuthButton.dart';
import 'CustomTextField.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordObscure = true;
  final String title = "تسجيل الدخول";
  void updateState() {
    setState(() {
      print(isPasswordObscure);
      isPasswordObscure = !isPasswordObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            CustomAppBar(title: "تسجيل الدخول", onPress: () {}),
            const SizedBox(
              height: 24,
            ),
            CustomTextField(
              isPasswordObscure: isPasswordObscure,
              emailController: emailController,
              passwordController: passwordController,
              onPressed: updateState,
            ),
            const SizedBox(
              height: 33,
            ),
            CustomAuthButton(title: title, onPressed: () {},),
            Container()
          ],
        ),
      ),
    );
  }
}

