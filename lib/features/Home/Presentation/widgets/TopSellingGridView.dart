import 'package:flutter/material.dart';

import '../../../../Core/Data/Model/Product.dart';
import '../../../../Core/utils/widgets/FruitItem.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;
  const ProductsGridView({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => FruitItem(product: products[index]),
        childCount: 10,
      ),
    );
  }
}
