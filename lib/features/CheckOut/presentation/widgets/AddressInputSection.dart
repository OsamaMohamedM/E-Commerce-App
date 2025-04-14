import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import '../../cubits/checkOutCubit/cubit/check_out_cubit.dart';

class AddressInputSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateModeNotifier;

  AddressInputSection({
    super.key,
    required this.formKey,
    required this.autovalidateModeNotifier,
  });

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormFiledItem(
                onChanged: (String? val) {
                  context
                      .read<CheckOutCubitCubit>()
                      .shippingAddressEntity
                      .name = val;
                },
                onPressed: () {},
                isObscure: false,
                isPassword: false,
                hint: "اسم المستخدم",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormFiledItem(
                onChanged: (String? val) {
                  context
                      .read<CheckOutCubitCubit>()
                      .shippingAddressEntity
                      .email = val;
                },
                onPressed: () {},
                isObscure: false,
                isPassword: false,
                hint: "البريد الالكتروني",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormFiledItem(
                onChanged: (String? val) {
                  context
                      .read<CheckOutCubitCubit>()
                      .shippingAddressEntity
                      .address = val;
                },
                onPressed: () {},
                isObscure: false,
                isPassword: false,
                hint: "العنوان",
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormFiledItem(
                onPressed: () {},
                isObscure: false,
                isPassword: false,
                hint: "المدينة",
                onChanged: (String? val) {
                  context
                      .read<CheckOutCubitCubit>()
                      .shippingAddressEntity
                      .city = val;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormFiledItem(
                onPressed: () {},
                isObscure: false,
                isPassword: false,
                hint: 'رقم الطابق - رقم الشقة',
                onChanged: (String? val) {
                  context
                      .read<CheckOutCubitCubit>()
                      .shippingAddressEntity
                      .addressDetails = val;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormFiledItem(
                onPressed: () {},
                isObscure: false,
                isPassword: false,
                hint: "رقم الهاتف",
                onChanged: (String? val) {
                  context
                      .read<CheckOutCubitCubit>()
                      .shippingAddressEntity
                      .phone = val;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
