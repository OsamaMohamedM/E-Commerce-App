import 'package:flutter/material.dart';

import '../../../../Core/utils/widgets/FruitItem.dart';

class TopSellingGridView extends StatelessWidget {
  const TopSellingGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163/214,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => FruitItem(),
        childCount: 10,
      ),
    );
  }
}
