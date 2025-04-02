import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../Core/helpers/getFakeProduct.dart';
import '../../../../Core/utils/widgets/CustomAppBar.dart';
import '../../../../Core/utils/widgets/CustomErrorWidget.dart';
import '../../../Home/Presentation/widgets/CustomSearchFiled.dart';
import '../../../Home/Presentation/widgets/ProductsGridView.dart';
import '../../../Home/views_model/productCubit/bloc/ProductCubit.dart';
import 'ProductHeader.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              CustomAppBar(
                tittle: 'المنتجات',
                visibleLeading: false,
              ),
              const SizedBox(
                height: 26,
              ),
              CustomSearchFiled(),
              const SizedBox(
                height: 12,
              ),
              ProductViewHeader(
                productLength: BlocProvider.of<ProductCubit>(context)
                    .BestSellingProductLength,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          )),
          BlocBuilder<ProductCubit, ProductCubitState>(
            builder: (context, state) {
              if (state is ProductCubitFailure) {
                return SliverToBoxAdapter(
                    child: CustomErrorWidget(
                  message: state.message,
                ));
              } else if (state is ProductCubitSuccess) {
                return ProductsGridView(
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
