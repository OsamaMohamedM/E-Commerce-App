import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Repo/OrderRepo.dart';
import '../../Data/models/Order.dart';
import 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;

  Future<void> addOrder(OrderEntity order) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(order);
    result.fold((l) => emit(AddOrderFailure(message: l.message)),
        (r) => emit(AddOrderSuccess()));
  }
}
