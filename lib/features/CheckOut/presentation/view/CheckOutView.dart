import 'package:e_commerce/features/CheckOut/cubits/cubit/add_order_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../Core/Services/get_it.dart';
import '../../../Cart/Data/models/CartEntity.dart';
import '../../Data/Repo/OrderRepo.dart';
import '../../Data/models/Order.dart';
import '../widgets/AddOrderBlocConsumer.dart';

class CheckOutView extends StatefulWidget {
  final CartEntity order;
  const CheckOutView({super.key, required this.order});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
 late OrderEntity orderEntity;
  @override
  void initState() {
  orderEntity =   OrderEntity(
        cartEntity: widget.order, uid: FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(
        getIt.get<OrderRepo>(),
      ),
      child: SafeArea(
        child: Scaffold(
          body: Provider.value(
              value:orderEntity , child: AddOrderBlocConsumer()),
        ),
      ),
    );
  }
}
