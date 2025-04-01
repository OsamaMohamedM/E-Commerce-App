import 'package:e_commerce/Core/utils/widgets/FruitItemImage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/models/CartItem.dart';
import '../../view_model/cubit/cart_cubit.dart';
import 'ProductInfo.dart';
import 'QuantityAndPrice.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const CartItem({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FruitItemImage(image: cartItemEntity.product.image!),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProductInfo(product: cartItemEntity),
                Spacer(),
                QuantityAndPrice(
                  product: cartItemEntity,
                  counter: cartItemEntity.count,
                  onIncrement: () => BlocProvider.of<CartCubit>(context).addToCart(cartItemEntity.product),
                  onDecrement: () {
                   BlocProvider.of<CartCubit>(context).decreaseFromCart(cartItemEntity.product);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
