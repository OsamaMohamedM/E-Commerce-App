import 'package:flutter/widgets.dart';

import 'ProductCartImage.dart';
import 'ProductInfo.dart';
import 'QuantityAndPrice.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductCartImage(),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ProductInfo(),
                Spacer(),
                QuantityAndPrice(
                  counter: counter,
                  onIncrement: () => setState(() => counter++),
                  onDecrement: () {
                    if (counter > 0) setState(() => counter--);
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

