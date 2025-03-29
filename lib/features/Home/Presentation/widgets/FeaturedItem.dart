import 'package:flutter/material.dart';

import '../../../../Core/utils/constants/assetsImages.dart';
import 'FeaturedItemText.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
    required this.itemWidth,
  });

  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 158,
        child: Stack(children: [
          Positioned(
            left: 0,
            bottom: 0,
            top: 0,
            right: itemWidth * 0.45,
            child: Image.asset(
              Assets.assetsImagesTest,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: itemWidth * 0.5,
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(Assets.assetsImagesWaterMellonTest),
              fit: BoxFit.fill,
            )),
            child: FeaturedItemText(),
          )
        ]),
      ),
    );
  }
}
