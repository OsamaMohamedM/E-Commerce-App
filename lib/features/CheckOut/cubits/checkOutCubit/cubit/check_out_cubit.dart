import 'package:e_commerce/features/CheckOut/Data/models/Order.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Data/models/ShippingAddress.dart';
import 'check_out_cubit_state.dart';

class CheckOutCubitCubit extends Cubit<CheckOutCubitState> {

  final OrderEntity orderEntity;
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();

  CheckOutCubitCubit(this.orderEntity) : super(CheckOutCubitInitial());


  void addPaywithCash(bool value) {
    orderEntity.payWithCash = value;
  }

  void addAddressShipping()
  {
    orderEntity.shippingAddress = shippingAddressEntity;
  }

}
