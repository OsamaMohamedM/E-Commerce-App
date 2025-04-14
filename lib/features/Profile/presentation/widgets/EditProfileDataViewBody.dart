
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:e_commerce/Core/utils/widgets/CustomButton.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import '../../../Cart/view_model/cubit/cart_cubit.dart';
import '../../cubits/EditProfileData/EditProfileDatacubit.dart';

class EditProfileDataViewBody extends StatefulWidget {
  final void Function(int index) onTabChange;
  const EditProfileDataViewBody({super.key, required this.onTabChange});

  @override
  State<EditProfileDataViewBody> createState() =>
      _EditProfileDataViewBodyState();
}

class _EditProfileDataViewBodyState extends State<EditProfileDataViewBody> {
  bool isObscure1 = true;
  bool isObscure2 = true;
  String name = '',
      email = '',
      password = '',
      newPassword = '',
      confirmNewPassword = '';
  final GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  Widget build(BuildContext context) {
    final user = context.read<CartCubit>().userData;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                  tittle: 'تعديل الملف الشخصي',
                  visibleLeading: true,
                  visibleTrailing: false,
                  onPressed: () {
                    widget.onTabChange(3);
                  }),
              const SizedBox(
                height: 16,
              ),
              Text(
                'المعلومات الشخصيه',
                style: TextStyles.bold13,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiledItem(
                enable: user!.isFromSocial,
                hint: context.watch<CartCubit>().userData!.name,
                onPressed: () {},
                onChanged: (value) => name = value ?? '',
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormFiledItem(
                enable: user.isFromSocial,
                hint: FirebaseAuth.instance.currentUser!.email!,
                onPressed: () {},
                onChanged: (value) => email = value ?? '',
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                'تغيير كلمة المرور',
                style: TextStyles.bold13,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormFiledItem(
                enable: user.isFromSocial,
                onChanged: (value) => password = value ?? '',
                hint: 'كلمة المرور القديمة',
                isPassword: true,
                isObscure: isObscure1,
                onPressed: () {
                  setState(() {
                    isObscure1 = !isObscure1;
                  });
                },
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormFiledItem(
                enable: user.isFromSocial,
                hint: 'كلمة المرور الجديدة',
                isPassword: true,
                isObscure: isObscure2,
                onPressed: () {
                  setState(() {
                    isObscure2 = !isObscure2;
                  });
                },
                onChanged: (value) => newPassword = value ?? '',
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextFormFiledItem(
                enable: user!.isFromSocial,
                hint: 'تأكيد كلمة المرور',
                isPassword: true,
                isObscure: isObscure2,
                onPressed: () {
                  setState(() {
                    isObscure2 = !isObscure2;
                  });
                },
                onChanged: (value) => confirmNewPassword = value ?? '',
              ),
              const SizedBox(
                height: 74,
              ),
              CustomButton(
                  onPressed: () {
                    if (!user.isFromSocial) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'لا يمكن تعديل الملف الشخصي من حساب جوجل او فيسبوك'),
                        ),
                      );
                      return;
                    }
                    //if (_formKey.currentState.validate())
                     {
                      if (newPassword != confirmNewPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('كلمة المرور غير متطابقة'),
                          ),
                        );
                        return;
                      }
                      context.read<EditProfileDataCubit>().updateProfile(
                            displayName: name.trim(),
                            newEmail: email.trim(),
                            currentPassword: password.trim(),
                            newPassword: newPassword.trim(),
                          );
                    }
                  },
                  buttonName: 'حفظ التغييرات'),
            ],
          ),
        ),
      ),
    );
  }
}
