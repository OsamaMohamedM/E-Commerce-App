import 'package:flutter/material.dart';
import '../../../Auth/Presentation/widgets/CustomTextFormFiledItem.dart';

class AddressInputSection extends StatefulWidget {
  const AddressInputSection({super.key});

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection> {
  late TextEditingController nameTextEditingController;

  late TextEditingController emailTextEditingController;

  late TextEditingController addressTextEditingController;

  late TextEditingController cityTextEditingController;

  late TextEditingController floorNumberTextEditingController;

  late TextEditingController phoneNumberTextEditingController;

  @override
  void initState() {
    nameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    addressTextEditingController = TextEditingController();
    cityTextEditingController = TextEditingController();
    floorNumberTextEditingController = TextEditingController();
    phoneNumberTextEditingController = TextEditingController();
    super.initState();
  }
@override
  void dispose() {
    nameTextEditingController.dispose();
    emailTextEditingController.dispose();
    addressTextEditingController.dispose();
    cityTextEditingController.dispose();
    floorNumberTextEditingController.dispose();
    phoneNumberTextEditingController.dispose();
    
    super.dispose();
  }

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
        const SizedBox(
          height: 8,
        ),
        CustomTextFormFiledItem(
          controller: emailTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "البريد الالكتروني",
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormFiledItem(
          controller: addressTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "العنوان",
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormFiledItem(
          controller: cityTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "المدينة",
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormFiledItem(
          controller: floorNumberTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: 'رقم الطابق - رقم الشقة',
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormFiledItem(
          controller: phoneNumberTextEditingController,
          onPressed: () {},
          isObscure: false,
          isPassword: false,
          title: "رقم الهاتف",
        ),
      ],
    );
  }
}
