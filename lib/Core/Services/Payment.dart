import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../features/CheckOut/Data/models/Order.dart';
import '../../features/CheckOut/Data/models/payement_entity.dart';
import '../../features/CheckOut/cubits/AddOrderCubit/add_order_cubit.dart';
import '../utils/constants/app_keys.dart';

class Payment {
  final OrderEntity orderEntity;
  Payment({required this.orderEntity});
  bool handlePayment(BuildContext context) {
    final addOrderCubit = context.read<AddOrderCubit>();
    final PaymentEntity paymentEntity = PaymentEntity.fromEntity(orderEntity);
    bool isSuccess = false;
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: Client_ID,
        secretKey: Secret_key,
        transactions: [
          paymentEntity.toMap(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('تمت العمليه بنجاح')));
          addOrderCubit.addOrder(orderEntity);
          isSuccess = true;
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('حدث خطأ في الدفع')));
          isSuccess = false;
          Navigator.pop(context);
        },
        onCancel: () {
          isSuccess = false;
          log('cancelled:');
        },
      ),
    ));
    return isSuccess;
  }
}
