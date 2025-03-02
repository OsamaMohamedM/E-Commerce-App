import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/utils/styles/textStyles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.backGroundImage,
      required this.image,
      required this.subTitle,
      required this.title, required this.visible});
  final String backGroundImage, image;
  final String subTitle;
  final Widget title;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                backGroundImage,
                fit: BoxFit.fill,
              )),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
              Visibility(
                visible: visible,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('تخط',
                      style:TextStyles.regular16),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(subTitle,
              textAlign: TextAlign.center,
              style:TextStyles.semiBold16),
        ),
      ],
    );
  }
}
