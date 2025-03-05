import 'package:e_commerce/features/Auth/Presentation/widgets/SocialLoginOptionsSection.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/LoginFormSection.dart';

import '../../../../Core/utils/styles/textStyles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
             const LoginFormSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
              children:[ TextButton(
                onPressed: () {},
                child: const Text(
                  "نسيت كلمة المرور؟",
                  style: TextStyles.semiBold13,
                ),
              )]),
              const SocialLoginOptionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
