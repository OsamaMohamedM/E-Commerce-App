import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../features/CheckOut/Data/models/Order.dart';
import '../../features/CheckOut/Data/models/payement_entity.dart';
import '../utils/constants/app_keys.dart';

class Payment {
  final OrderEntity orderEntity;
  Payment({required this.orderEntity});
  void handlePayment(BuildContext context) {
    final PaymentEntity paymentEntity = PaymentEntity.fromEntity(orderEntity);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: Client_ID,
        secretKey: Secret_key,
        transactions:  [
          paymentEntity.toMap(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تمت العمليه بنجاح')));
         Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('حدث خطأ في الدفع')));
          Navigator.pop(context);
        
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ));
  }
}
