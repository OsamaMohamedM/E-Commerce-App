import 'package:flutter/material.dart';
import '../../../Auth/Presentation/widgets/CustomTextFormFiledItem.dart';

class AddressInputSection extends StatelessWidget {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController floorNumberTextEditingController = TextEditingController();

  AddressInputSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormFiledItem(
          controller: nameTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "اسم المستخدم",
        ),
        const SizedBox(height:8 ,),
        CustomTextFormFiledItem(
          controller: emailTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "البريد الالكتروني",
        ),
        const SizedBox(height:8 ,),
        CustomTextFormFiledItem(
          controller: addressTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "العنوان",   
          ),
        const SizedBox(height:8 ,),
        CustomTextFormFiledItem(
          controller: cityTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "المدينة",
        ),
        const SizedBox(height:8 ,),
        CustomTextFormFiledItem(
          controller: floorNumberTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: 'رقم الطابق - رقم الشقة',
        ),
      ],
    );
  }
}
