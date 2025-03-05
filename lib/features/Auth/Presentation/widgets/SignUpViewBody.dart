import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAuthButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
              height: 14,
            ),
             Center(
              child: CustomTermsAndConditionsText(
                  title: "لديك حساب بالفعل؟ ", subtitle: "تسجيل الدخول" , onTap:(){
                    GoRouter.of(context).go(AppRoutes.loginView);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

