import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/Cart/view_model/cubit/cart_cubit.dart';
import '../../AppRoutes.dart';
import 'FavoriteButton.dart';
import 'FruitItemDetails.dart';
import 'FruitItemImage.dart';

class FruitGridViewItem extends StatelessWidget {
  final ProductEntity product;
  const FruitGridViewItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.fruitDetails, extra: {
          "product": product,
          "cartCubit": context.read<CartCubit>()
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        color: Color(0xFFF3F5F7),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: -5,
              child: FavoriteButton(productId: product.code),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
