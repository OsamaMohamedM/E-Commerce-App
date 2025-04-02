import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Data/Model/ProductEntity.dart';
import '../../../Cart/view_model/cubit/cart_cubit.dart';
import '../widgets/SearchViewBody.dart';

class SearchView extends StatelessWidget {
  final CartCubit cartCubit;
  final List<ProductEntity> productEntityList;
  const SearchView({super.key, required this.productEntityList, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cartCubit,
      child: Scaffold(
          body: SafeArea(
              child: SearchViewBody(
                      productEntityList: productEntityList,
                    ))),
    );
  }
}
