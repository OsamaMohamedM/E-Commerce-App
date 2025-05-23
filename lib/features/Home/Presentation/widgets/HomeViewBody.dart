import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:e_commerce/features/Home/Presentation/widgets/CustomSearchFiled.dart';
import 'package:e_commerce/features/Home/Presentation/widgets/ProductsGridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Core/AppRoutes.dart';
import '../../../../Core/helpers/getFakeProduct.dart';
import '../../../../Core/utils/styles/textStyles.dart';
import '../../../../Core/utils/widgets/CustomErrorWidget.dart';
import '../../views_model/productCubit/bloc/ProductCubit.dart';
import 'BestSellingHeader.dart';
import 'CustomAppBarHomeView.dart';
import 'ListFeaturedItem.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.itemWidth,
  });

  final double itemWidth;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              CustomAppBarHomeView(),
              const SizedBox(
                height: 26,
              ),
              GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRoutes.searchView, extra: {
                      "product": context.read<ProductCubit>().products,
                      "cartCubit": context.read<CartCubit>(),
                    });
                  },
                  child: CustomSearchFiled()),
              SizedBox(
                  height: 200, child: ListFeaturedItem(itemWidth: itemWidth)),
              const SizedBox(
                height: 12,
              ),
              BestSellingHeader(),
              const SizedBox(
                height: 12,
              ),
            ],
          )),
          BlocBuilder<ProductCubit, ProductCubitState>(
            builder: (context, state) {
              if (state is ProductCubitFailure) {
                return SliverToBoxAdapter(
                    child: CustomErrorWidget(message: state.message));
              } else if (state is ProductCubitSuccess) {
                return state.products.isEmpty
                    ? SliverToBoxAdapter(
                        child: Center(
                            child: Text(
                        'لا توجد منتجات للعرض!',
                        style: TextStyles.bold19,
                      )))
                    : ProductsGridView(
                        products: state.products,
                      );
              } else {
                return Skeletonizer.sliver(
                  enabled: true,
                  child: ProductsGridView(products: getProducts()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
