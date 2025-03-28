import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CustomTextFormFiledItem extends StatelessWidget {
  const CustomTextFormFiledItem({
    super.key,
    required this.title,
    this.isObscure = false,
    this.isPassword = false,
    required this.onPressed, 
    this.onSaved,
  });

  final String title;
  final bool isObscure;
  final bool isPassword;
  final VoidCallback onPressed;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) =>
          value == null || value.isEmpty ? 'الحقل مطلوب' : null,
      obscureText: isObscure,
      decoration: InputDecoration(
          suffixIcon: isPassword
              ? IconButton(
                  icon: isObscure
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                  onPressed: onPressed,
                )
              : null,
          hintText: title,
          hintStyle: TextStyles.bold13.copyWith(color: const Color(0xff949D9E)),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide:
          const BorderSide(width: 1, color: AppColors.customTextFieldBorder),
    );
  }
}
