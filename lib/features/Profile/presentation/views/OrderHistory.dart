import 'package:flutter/material.dart';
import '../widgets/OrderHistoryBody.dart';

class OrderHistory extends StatelessWidget {
    final void Function(int index) onTabChange;
const OrderHistory({ super.key , required this.onTabChange});

  @override
  Widget build(BuildContext context){
    return Scaffold(body: SafeArea(child: OrderHistoryBody(onTabChange : onTabChange)));
  }
}