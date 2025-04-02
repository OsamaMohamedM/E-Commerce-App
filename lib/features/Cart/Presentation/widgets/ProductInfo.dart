import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/CartItem.dart';
import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/styles/textStyles.dart';

class ProductInfo extends StatelessWidget {
  final CartItemEntity product;
  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.product.name, style: TextStyles.bold13),
            Text(
              product.clcWeight().toString() + ' كيلو',
              style:
                  TextStyles.regular13.copyWith(color: AppColors.myAmberColor),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            context.watch<CartCubit>().removeFromCart(product.product);
          },
        ),
      ],
    );
  }
}
