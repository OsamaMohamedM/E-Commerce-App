import 'package:e_commerce/Core/utils/constants/assetsImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/textStyles.dart';

class CustomAppBar extends StatelessWidget {
  final String tittle;
  final bool visibleLeading;
  final bool visibleTrailing;
  const CustomAppBar({
    required this.tittle,
    this.visibleLeading = true,
    this.visibleTrailing = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tittle,
        style: TextStyles.bold19.copyWith(color: Colors.black),
        textAlign: TextAlign.center,
      ),
      trailing: Visibility(
        visible: visibleTrailing,
        child: Container(
          padding: EdgeInsets.all(14),
          decoration:
              ShapeDecoration(shape: OvalBorder(), color: Color(0xFFEEF8ED)),
          child: SvgPicture.asset(
            Assets.assetsImagesNotification,
            fit: BoxFit.fill,
          ),
        ),
      ),
      leading: Visibility(
          visible: visibleLeading,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          )),
    );
  }
}
