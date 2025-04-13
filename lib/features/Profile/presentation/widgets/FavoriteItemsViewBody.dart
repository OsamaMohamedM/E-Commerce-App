import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

import '../../../Home/Presentation/widgets/ProductsGridView.dart';

class FavoriteItemsViewBody extends StatelessWidget {
  final void Function(int index) onTabChange;
  const FavoriteItemsViewBody({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(
                  tittle: 'المفضلة',
                  visibleLeading: true,
                  visibleTrailing: false,
                  onPressed: () => onTabChange(3),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          ProductsGridView(
          products: [],
        )
        ],
      ),
    );
  }
}
