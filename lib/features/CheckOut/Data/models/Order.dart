// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'ShippingAddress.dart';

class Order {
  bool? payWithCash;
  CartEntity cartEntity;
  ShippingAddressEntity? shippingAddress;
  Order({
    this.payWithCash,
    required this.cartEntity,
    ShippingAddressEntity? shippingAddress,
  }) : shippingAddress = shippingAddress ?? ShippingAddressEntity();
}
