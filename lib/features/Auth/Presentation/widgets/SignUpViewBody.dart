import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAuthButton.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import 'CustomTermsAndConditionsRow.dart';
import 'CustomTermsAndConditionsText.dart';
import 'SignUpFormSection.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            const SignUpFormSection(),
            const SizedBox(height: 16),
            const CustomTermsAndConditionsRow(),
            const SizedBox(
              height: 24,
            ),
            CustomAuthButton(title: "إنشاء حساب جديد", onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CustomTermsAndConditionsText(
                  title: "لديك حساب بالفعل؟ ", subtitle: "تسجيل الدخول"),
            )
          ],
        ),
      ),
    );
  }
}

