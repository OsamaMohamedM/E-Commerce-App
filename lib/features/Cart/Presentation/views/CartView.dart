import 'package:flutter/material.dart';

import '../widgets/CartViewBody.dart';

class CartView extends StatelessWidget {
const CartView({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(body: SafeArea(child: CartViewBody()));
  }
}