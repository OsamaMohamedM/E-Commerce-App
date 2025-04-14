import 'package:flutter/material.dart';

import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CustomTextFormFiledItem extends StatefulWidget {
   const CustomTextFormFiledItem({
    super.key,
    required this.hint,
    this.isObscure = false,
    this.isPassword = false,
    this.onPressed,
    this.onChanged,
  });

  final String hint;
  final bool isObscure;
  final bool isPassword;
  final VoidCallback? onPressed;
  final void Function(String?)? onChanged;

  @override
  State<CustomTextFormFiledItem> createState() => _CustomTextFormFiledItemState();
}

class _CustomTextFormFiledItemState extends State<CustomTextFormFiledItem> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      validator: (value) =>
          value == null || value.isEmpty ? 'الحقل مطلوب' : null,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: widget.isObscure
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.visibility_off),
                  onPressed: widget.onPressed,
                )
              : null,
              
          hintText: widget.hint,
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
