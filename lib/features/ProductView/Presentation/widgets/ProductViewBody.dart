import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../Core/helpers/getFakeProduct.dart';
import '../../../../Core/utils/widgets/CustomAppBar.dart';
import '../../../../Core/utils/widgets/CustomErrorWidget.dart';
import '../../../Home/Presentation/widgets/CustomSearchFiled.dart';
import '../../../Home/Presentation/widgets/TopSellingGridView.dart';
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
              CustomAppBar(tittle: 'المنتجات',enable: false,),
              const SizedBox(
                height: 26,
              ),
              CustomSearchFiled(),
              const SizedBox(
                height: 12,
              ),
              ProductViewHeader(
                productLength:
                    BlocProvider.of<ProductCubit>(context).productLength,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          )),
          BlocBuilder<ProductCubit, ProductCubitState>(
            builder: (context, state) {
              if (state is ProductCubitFailure) {
                return const SliverToBoxAdapter(child: CustomErrorWidget());
              } else if (state is ProductCubitSuccess) {
                return ProductsGridView(
                  products: state.products,
                );
              } else {
                return Skeletonizer.sliver(
                  enabled: true,
                  child: ProductsGridView(
                      products: getProducts()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
