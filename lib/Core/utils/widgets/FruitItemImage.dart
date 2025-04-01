import 'dart:developer';

import 'package:flutter/material.dart';

class FruitItemImage extends StatelessWidget {
  final String image;
  const FruitItemImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    log("+++++++++++"+image);
    return Image.network(
      image,
      fit: BoxFit.fill,
    );
  }
}
