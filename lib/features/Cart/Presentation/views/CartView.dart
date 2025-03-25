import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit/cart_cubit.dart';
import '../widgets/CartViewBody.dart';

class CartView extends StatelessWidget {
const CartView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(body: SafeArea(child: CartViewBody(cartEntity: context.watch<CartCubit>().cartEntity,)));
  }
}