import 'package:flutter/material.dart';
import '../../../../Core/utils/styles/app_colors.dart';
import '../../../../Core/utils/widgets/CustomAppBar.dart';
import 'CartItem.dart';
import 'CartResult.dart';

class CartViewBody extends StatelessWidget {
  CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.5, vertical: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                CustomAppBar(tittle: 'السلة', visibleTrailing: false),
                SizedBox(height: 26),
                CartResult(),
                SizedBox(height: 24),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Column(
              children: [
                Divider(
                  color: AppColors.customTextFieldBorder,
                ),
                SizedBox(
                    width: double.infinity, height: 150, child: CartItem()),
                Divider(
                  color: AppColors.customTextFieldBorder,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
