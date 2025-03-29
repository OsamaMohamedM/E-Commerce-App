// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'ShippingAddress.dart';

class OrderEntity {
  String uid;
  bool? payWithCash;
  CartEntity cartEntity;
  ShippingAddressEntity? shippingAddress;
  OrderEntity({
    this.payWithCash,
    required this.cartEntity,
    required this.uid,
    ShippingAddressEntity? shippingAddress,
  }) : shippingAddress = shippingAddress ?? ShippingAddressEntity();

  toMap() => {
        'payWithCash': payWithCash,
        'uid': uid,
        'cartEntity': cartEntity.toJson(),
        'shippingAddress': shippingAddress!.toJson(),
      };

  clcShippingCost() {
    if (payWithCash == true) {
      return 20;
    } else {
      return 0;
    }
  }

  double clcShippingDiscount() {
    return 0;
  }

  double CalculateAllPrice() {
    return cartEntity.clcTotal() + clcShippingCost() - clcShippingDiscount();
  }
}
