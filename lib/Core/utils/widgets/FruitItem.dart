
import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../AppRoutes.dart';
import 'FavoriteButton.dart';
import 'FruitItemDetails.dart';
import 'FruitItemImage.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity product;
  const FruitItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.fruitDetailsView, extra: product);
      },
      child: Container(
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
                FruitItemImage(image: product.image!),
                const SizedBox(
                  height: 24,
                ),
                FruitItemDetails(product: product),
                const SizedBox(
                  height: 19,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
