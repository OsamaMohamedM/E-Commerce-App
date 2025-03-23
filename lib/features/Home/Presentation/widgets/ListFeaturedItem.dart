import 'package:flutter/material.dart';

import 'FeaturedItem.dart';

class ListFeaturedItem extends StatelessWidget {
  const ListFeaturedItem({
    super.key,
    required this.itemWidth,
  });

  final double itemWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 8.0, right: 8.0),
        child: FeaturedItem(itemWidth: itemWidth),
      ),
    );
  }
}
