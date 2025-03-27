import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'package:flutter/material.dart';

import '../widgets/CheckOutBody.dart';

class CheckOutView extends StatelessWidget {
  final CartEntity cartEntity;
  const CheckOutView({super.key ,required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckOutViewBody(),
    );
  }
}
