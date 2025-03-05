import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAuthButton.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import 'SignUpFormSection.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool value = false;
  void onChanged(bool? newValue) {
    setState(() {
      value = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            const SignUpFormSection(),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: value,
                  onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                const CustomTermsAndConditionsText(title: "من خلال إنشاء حساب ، فإنك توافق علي ",subtitle: "الشروط والأحكام الخاصة بنا",)
              ],
            ),
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

class CustomTermsAndConditionsText extends StatelessWidget {
  const CustomTermsAndConditionsText({
    super.key, required this.title, required this.subtitle,
  });
  final String title;
  final String subtitle;
  
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text.rich(
        TextSpan(
            text: title,
            style:
                TextStyles.semiBold13.copyWith(color: AppColors.grayTextColor),
            children: [
              TextSpan(
                  text: subtitle,
                  style: TextStyles.bold13
                      .copyWith(color: AppColors.lightPrimaryColor))
            ]),
        overflow: TextOverflow.visible,
      ),
    );
  }
}
