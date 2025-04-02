import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Data/Model/ProductEntity.dart';
import '../../../Cart/view_model/cubit/cart_cubit.dart';
import '../widgets/FruitDetailsBody.dart';

class FruitDetails extends StatelessWidget {
  final ProductEntity product;
    final CartCubit cartCubit;
  const FruitDetails({super.key, required this.product, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:cartCubit ,
      child: Scaffold(
        body: SafeArea(
            child: FruitDetailsBody(
          product: product,
          
        )),
      ),
    );
  }
}
