import 'package:flutter/material.dart';

import '../../../../Core/utils/constants/assetsImages.dart';

class ProductCartImage extends StatelessWidget {
  const ProductCartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF3F5F7),
      child: Center(child: Image.asset(Assets.assetsImagesTest)),
    );
  }
}

