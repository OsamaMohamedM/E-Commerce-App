import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import '../../Data/models/Order.dart';

class AddressInputSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateModeNotifier;
  const AddressInputSection(
      {super.key,
      required this.formKey,
      required this.autovalidateModeNotifier});

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable: widget.autovalidateModeNotifier,
      builder: (context, value, child) => Form(
        key: widget.formKey,
        child: Column(
          children: [
            CustomTextFormFiledItem(
              onSaved: (String? val) {
                context.read<OrderEntity>().shippingAddress!.name = val;
              },
              onPressed: () {},
              isObscure: false,
              isPassword: false,
              title: "اسم المستخدم",
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormFiledItem(
              onSaved: (String? val) {
                context.read<OrderEntity>().shippingAddress!.email = val;
              },
              onPressed: () {},
              isObscure: false,
              isPassword: false,
              title: "البريد الالكتروني",
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormFiledItem(
              onSaved: (String? val) {
                context.read<OrderEntity>().shippingAddress!.address = val;
              },
              onPressed: () {},
              isObscure: false,
              isPassword: false,
              title: "العنوان",
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormFiledItem(
              onPressed: () {},
              isObscure: false,
              isPassword: false,
              title: "المدينة",
              onSaved: (String? val) {
                context.read<OrderEntity>().shippingAddress!.city = val;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormFiledItem(
              onPressed: () {},
              isObscure: false,
              isPassword: false,
              title: 'رقم الطابق - رقم الشقة',
              onSaved: (String? val) {
                context.read<OrderEntity>().shippingAddress!.addressDetails =
                    val;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormFiledItem(
              onPressed: () {},
              isObscure: false,
              isPassword: false,
              title: "رقم الهاتف",
              onSaved: (String? val) {
                context.read<OrderEntity>().shippingAddress!.phone = val;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
