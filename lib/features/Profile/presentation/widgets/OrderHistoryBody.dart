import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/utils/widgets/CustomAppBar.dart';

import '../../cubits/OrderHistoryCubit/order_history_cubit.dart';
import '../../cubits/OrderHistoryCubit/order_history_state.dart';
import 'OrderCard.dart';

class OrderHistoryBody extends StatefulWidget {
  final void Function(int index) onTabChange;
  final String uid;

  const OrderHistoryBody({
    super.key,
    required this.onTabChange,
    required this.uid,
  });

  @override
  State<OrderHistoryBody> createState() => _OrderHistoryBodyState();
}

class _OrderHistoryBodyState extends State<OrderHistoryBody> {
  List<bool> expanded = [];

  @override
  void initState() {
    super.initState();
    context.read<OrderManagementCubit>().getOrders(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            tittle: "تتبع الطلبات",
            visibleLeading: true,
            visibleTrailing: false,
            onPressed: () {
              widget.onTabChange(3);
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<OrderManagementCubit, OrderState>(
              builder: (context, state) {
                if (state is OrderLoading) {
                  log("orders length");
                  return const Center(child: CircularProgressIndicator());
                } else if (state is OrderLoaded) {
                  final orders = state.orders;
                  if (expanded.length != orders.length) {
                    expanded = List.generate(orders.length, (_) => false);
                  }
                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return OrderCard(
                        order: orders[index],
                        isExpanded: expanded[index],
                        onTap: () {
                          setState(() {
                            expanded[index] = !expanded[index];
                          });
                        },
                      );
                    },
                  );
                } else if (state is OrderError) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
