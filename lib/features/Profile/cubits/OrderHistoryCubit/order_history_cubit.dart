import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/Repo/OrderHistoryRepo.dart';
import 'order_history_state.dart';

class OrderManagementCubit extends Cubit<OrderState> {
  final OrderHistoryRepo repository;

  OrderManagementCubit(this.repository) : super(OrderInitial());

  Future<void> getOrders(String uid) async {
    emit(OrderLoading());
    try {
      final orders = await repository.fetchOrders(uid);
      emit(OrderLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
