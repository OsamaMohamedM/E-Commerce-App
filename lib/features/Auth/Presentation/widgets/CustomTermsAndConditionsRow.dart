import 'package:flutter/material.dart';

import 'CustomTermsAndConditionsText.dart';

class CustomTermsAndConditionsRow extends StatefulWidget {
  const CustomTermsAndConditionsRow({super.key});

  @override
  State<CustomTermsAndConditionsRow> createState() =>
      _CustomTermsAndConditionsRowState();
}

class _CustomTermsAndConditionsRowState
    extends State<CustomTermsAndConditionsRow> {
  bool value = false;
  void onChanged(bool? value) {
    setState(() {
      this.value = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
       const Expanded(
          child:  CustomTermsAndConditionsText(
            title: "من خلال إنشاء حساب ، فإنك توافق علي ",
            subtitle: "الشروط والأحكام الخاصة بنا",
          ),
        )
      ],
    );
  }
}
