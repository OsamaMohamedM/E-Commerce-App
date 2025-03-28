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

  toJson() => {
        'payWithCash': payWithCash,
        'uid': uid,
        'cartEntity': cartEntity.toJson(),
        'shippingAddress': shippingAddress!.toJson(),
      };
}
