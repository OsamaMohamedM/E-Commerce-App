import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'package:flutter/material.dart';

import '../widgets/CheckOutBody.dart';

class CheckOutView extends StatefulWidget {
  final CartEntity cartEntity;
  const CheckOutView({super.key ,required this.cartEntity});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CheckOutViewBody(),
      ),
    );
  }
}
