import 'package:flutter/material.dart';

import 'FavoriteButton.dart';
import 'FruitItemDetails.dart';
import 'FruitItemImage.dart';

class FruitItemBody extends StatelessWidget {
  const FruitItemBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      color: Color(0xFFF3F5F7),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 0,
            child: FavoriteButton(),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              FruitItemImage(),
              const SizedBox(
                height: 24,
              ),
              FruitItemDetails(),
              const SizedBox(
                height: 19,
              )
            ],
          ),
        ],
      ),
    );
  }
}
