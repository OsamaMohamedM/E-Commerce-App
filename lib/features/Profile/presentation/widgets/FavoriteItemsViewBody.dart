import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:e_commerce/Core/Services/SharedPrefrences.dart';
import 'package:e_commerce/Core/utils/widgets/CustomAppBar.dart';
import 'package:e_commerce/features/Home/views_model/productCubit/bloc/ProductCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/utils/constants/strings.dart';
import '../../../Home/Presentation/widgets/ProductsGridView.dart';

class FavoriteItemsViewBody extends StatelessWidget {
  final void Function(int index) onTabChange;
  const FavoriteItemsViewBody({super.key, required this.onTabChange});

  List<ProductEntity> getFavoriteProducts(List<ProductEntity> allProducts) {
    final fav = SharedPreferencesHelper.getStringList(FavProduct) ?? [];
    return allProducts
        .where((product) => fav.contains(product.code))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: BlocConsumer<ProductCubit, ProductCubitState>(
        listener: (context, state) {
        
        },
        builder: (context, state) {
          if (state is ProductCubitLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductCubitSuccess) {
            final allProducts = state.products;
            final favoriteProducts = getFavoriteProducts(allProducts);

            return CustomScrollView(
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
                ProductsGridView(products: favoriteProducts),
              ],
            );
          } else if (state is ProductCubitFailure) {
            return Center(child: Text("حدث خطأ: ${state.message}"));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
