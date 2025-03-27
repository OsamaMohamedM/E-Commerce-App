// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/features/Cart/Presentation/widgets/CartItem.dart';

import 'ShippingAddress.dart';

class Order {
  final String id;
  final bool payWithCash;
  List<CartItem> cartItems;
  final ShippingAddress shippingAddress;
  Order({
    required this.id,
    required this.payWithCash,
    required this.cartItems,
    required this.shippingAddress,
  });
}
