import 'package:flutter/material.dart';

import '../../../../Core/Data/Model/ProductEntity.dart';
import '../../../../Core/utils/widgets/FruitItem.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsGridView({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 132 / 214,
        crossAxisSpacing: 8,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FruitGridViewItem(
              key: ValueKey(products[index].code), product: products[index]),
        ),
        childCount: products.length,
      ),
    );
  }
}
