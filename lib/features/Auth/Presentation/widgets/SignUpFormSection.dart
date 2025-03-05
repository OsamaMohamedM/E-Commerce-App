import 'package:e_commerce/features/Auth/Presentation/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormField.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import 'package:flutter/material.dart';

class SignUpFormSection extends StatefulWidget {
const SignUpFormSection({ super.key });

  @override
  State<SignUpFormSection> createState() => _SignUpFormSectionState();
}

class _SignUpFormSectionState extends State<SignUpFormSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController(); 
  final passwordController = TextEditingController();
  bool isPasswordObscure = true;
  String title = "اسم المستخدم";
  void onPressed(){
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
  Widget build(BuildContext context){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal:16.0),
        child: Column(
          children: [
            CustomAppBar(title:"حساب جديد",onPress:() {} ,),
            const SizedBox(height: 24),
            CustomTextFormFiledItem(title: title, controller: nameController, onPressed: onPressed),
            const SizedBox(height: 16),
            CustomTextFormField(isPasswordObscure: isPasswordObscure, emailController: emailController, passwordController: passwordController, onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}