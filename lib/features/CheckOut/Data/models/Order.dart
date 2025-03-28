// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'ShippingAddress.dart';

class Order {
   bool? payWithCash;
  CartEntity cartEntity;
  final ShippingAddress? shippingAddress;
  Order({
    this.payWithCash,
    required this.cartEntity,
    this.shippingAddress,
  });
}
