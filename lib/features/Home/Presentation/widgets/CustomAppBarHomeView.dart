import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/utils/assetsImages.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CustomAppBarHomeView extends StatelessWidget {
  const CustomAppBarHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        Assets.assetsImagesUserPhoto,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      title: Text(
        'صباح الخير',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        'اسامه محمد',
        style: TextStyles.bold16,
      ),
      trailing: Container(
        padding: EdgeInsets.all(14),
        decoration:
            ShapeDecoration(shape: OvalBorder(), color: Color(0xFFEEF8ED)),
        child: SvgPicture.asset(
          Assets.assetsImagesNotification,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
