

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FruitItemImage extends StatelessWidget {
  final String image;
  const FruitItemImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Center(
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
