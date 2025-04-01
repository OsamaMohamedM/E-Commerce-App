// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/features/Cart/Data/models/CartEntity.dart';
import 'ShippingAddress.dart';

class OrderEntity  {
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
        'payMethood': (payWithCash == true ? 'Cash' : 'payPal'),
        'uid': uid,
        'status': 'pending',
        'date': DateTime.now().toString(),
        'cartEntity': cartEntity.toJson(),
        'total': cartEntity.clcTotal(),
        'shippingAddress': shippingAddress!.toJson(),
      };

  clcShippingCost() {
    if (payWithCash == true) {
      return 20;
    } else {
      return 0;
    }
  }

  void tragglePayWithCash(bool value) {
    payWithCash = value;
   
  }

  void updateShippingAddressEntity(ShippingAddressEntity newShippingAddressEntity)
  {
    shippingAddress = newShippingAddressEntity;
    
  }
  double clcShippingDiscount() {
    return 0;
  }

  double CalculateAllPrice() {
    return cartEntity.clcTotal() + clcShippingCost() - clcShippingDiscount();
  }
}
