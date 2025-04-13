import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../Core/utils/assetsImages.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import 'CustomListTile.dart';
import 'UserProfileInformationView.dart';

class ProfileViewBody extends StatelessWidget {
  final void Function(int index) onTabChange;
  const ProfileViewBody({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            tittle: "حسابي",
            visibleLeading: false,
            visibleTrailing: false,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: UserProfileInformationView(),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              'عام',
              style: TextStyles.semiBold13,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomListTile(
            title: 'الملف الشخصي',
            leading: Icon(Icons.person, color: AppColors.darkPrimaryColor),
            onTap: () {
              onTabChange(4);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          CustomListTile(
            title: 'طلباتي',
            leading: SvgPicture.asset(Assets.assetsImagesBox),
            onTap: () {
              onTabChange(5);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          CustomListTile(
            title: 'المفضلة',
            leading: Icon(Icons.favorite_border_outlined,
                color: AppColors.darkPrimaryColor),
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          CustomListTile(
            title: 'اللغة',
            leading: Icon(Icons.language, color: AppColors.darkPrimaryColor),
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          CustomListTile(
            title: 'الوضع',
            leading: Icon(Icons.dark_mode, color: AppColors.darkPrimaryColor),
            trialing: Switch(
              value: true,
              onChanged: (value) {},
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              'المساعدة',
              style: TextStyles.semiBold13,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomListTile(
            title: 'من نحن',
            leading:
                Icon(Icons.info_outline, color: AppColors.darkPrimaryColor),
            onTap: () {},
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffEBF9F1),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    'تسجيل الخروج',
                    style: TextStyles.semiBold13,
                  ),
                ),
                Positioned(
                  left: 30,
                  child: Icon(
                    Icons.logout,
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
