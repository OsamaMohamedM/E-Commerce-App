import 'package:e_commerce/features/Auth/Presentation/widgets/SocialLoginOptionsSection.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/LoginFormSection.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            LoginFormSection(),
            SocialLoginOptionsSection(),
          ],
        ),
      ),
    );
  }
}
