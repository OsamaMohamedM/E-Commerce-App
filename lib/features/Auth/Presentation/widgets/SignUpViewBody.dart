import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAuthButton.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTermsAndConditionsText.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormField.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/cubit/sign_up_cubit.dart';
import 'CustomTermsAndConditionsRow.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordObscure = true;
  late bool checkboxValue = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  void onPressed() {
    setState(() {
      isPasswordObscure = !isPasswordObscure;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Form(
          child: Column(
            children: [
              CustomAppBarAuth(title: "حساب جديد", onPress: () {}),
              const SizedBox(height: 24),
              CustomTextFormFiledItem(
                  title: 'اسم المستخدم',
                 
                  onPressed: onPressed),
              const SizedBox(height: 16),
              CustomTextFormField(
                  isPasswordObscure: isPasswordObscure,
                  
                  onPressed: onPressed),
              const SizedBox(height: 16),
              CustomTermsAndConditionsRow(onChanged: (value) {
                checkboxValue = value;
              }),
              const SizedBox(height: 24),
              CustomAuthButton(
                title: "إنشاء حساب جديد",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    if (checkboxValue) {
                      context.read<SignUpCubit>().createUserWithEmailPassword(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("يجب الموافقة على الشروط والأحكام"),
                        ),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 14),
              Center(
                child: CustomTermsAndConditionsText(
                    title: "لديك حساب بالفعل؟ ",
                    subtitle: "تسجيل الدخول",
                    onTap: () {
                      GoRouter.of(context).go(AppRoutes.loginView);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
