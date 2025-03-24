import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Core/utils/constants/assetsImages.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            suffixIcon: IconButton(
              icon: SvgPicture.asset(Assets.assetsImagesSetting4),
              onPressed: () {},
            ),
            hintText: '...ابحث عن',
            hintStyle: TextStyles.regular13.copyWith(color: Color(0xff949D9E)),
            fillColor: Colors.white,
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder()));
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xff949D9E), width: 1),
    );
  }
}
