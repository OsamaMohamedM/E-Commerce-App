import 'package:flutter/material.dart';
import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:e_commerce/Core/utils/widgets/CustomButton.dart';
import 'package:e_commerce/features/Auth/Presentation/widgets/CustomTextFormFiledItem.dart';
import '../../../../Core/utils/styles/textStyles.dart';
class EditProfileDataViewBody extends StatelessWidget {
  final void Function(int index) onTabChange;
  const EditProfileDataViewBody({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
                tittle: 'تعديل الملف الشخصي',
                visibleLeading: true,
                visibleTrailing: false,
                onPressed: () {
                  onTabChange(3);
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
              title: 'الاسم',
              onPressed: () {},
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormFiledItem(
              title: 'الاسم',
              onPressed: () {},
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
              title: 'كلمة المرور القديمة',
              onPressed: () {},
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormFiledItem(
              title: 'كلمة المرور الجديدة',
              onPressed: () {},
            ),
            const SizedBox(
              height: 14,
            ),
            CustomTextFormFiledItem(
              title: 'تأكيد كلمة المرور',
              onPressed: () {},
            ),
            const SizedBox(
              height: 74,
            ),
            CustomButton(onPressed: () {}, buttonName: 'حفظ التغييرات'),
          ],
        ),
      ),
    );
  }
}
