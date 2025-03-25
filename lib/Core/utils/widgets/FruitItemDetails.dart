import 'package:e_commerce/Core/utils/widgets/FruitItemName.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/Cart/view_model/cubit/cart_cubit.dart';
import '../../Data/Model/ProductEntity.dart';
import 'AddToCartButton.dart';

class FruitItemDetails extends StatelessWidget {
  final ProductEntity product;
  const FruitItemDetails({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FruitItemName(product: product),
        const Spacer(),
        AddToCartButton(
          onTap: () {
            context.read<CartCubit>().addToCart(product);
          },
        ),
      ],
    );
  }
}
