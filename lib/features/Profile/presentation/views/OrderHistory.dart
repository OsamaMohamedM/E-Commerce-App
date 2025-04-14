import 'package:e_commerce/Core/Services/get_it.dart';
import 'package:e_commerce/features/Cart/view_model/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/OrderHistoryCubit/order_history_cubit.dart';
import '../../data/Repo/OrderHistoryRepo.dart';
import '../widgets/OrderHistoryBody.dart';

class OrderHistory extends StatelessWidget {
  final void Function(int index) onTabChange;
  const OrderHistory({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderManagementCubit(getIt<OrderHistoryRepo>()),
      child: Scaffold(
          body: SafeArea(child: OrderHistoryBody(onTabChange: onTabChange, uid:context.read<CartCubit>().userData!.id ,))),
    );
  }
}
