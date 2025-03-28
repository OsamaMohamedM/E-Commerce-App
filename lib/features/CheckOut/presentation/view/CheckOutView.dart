import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Data/models/Order.dart';
import '../widgets/CheckOutViewBody.dart';

class CheckOutView extends StatefulWidget {
  final OrderEntity order;
  const CheckOutView({super.key, required this.order});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Provider.value(value: widget.order, child: CheckOutViewBody()),
      ),
    );
  }
}
