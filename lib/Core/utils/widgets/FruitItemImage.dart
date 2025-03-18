import 'package:flutter/material.dart';

import '../assetsImages.dart';

class FruitItemImage extends StatelessWidget {
  const FruitItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.assetsImagesTest,
      fit: BoxFit.fill,
    );
  }
}
