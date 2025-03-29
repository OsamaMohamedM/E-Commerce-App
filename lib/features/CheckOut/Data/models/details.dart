import 'dart:convert';

import 'package:e_commerce/features/CheckOut/Data/models/Order.dart';

class Details {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  Details({this.subtotal, this.shipping, this.shippingDiscount});

  @override
  String toString() {
    return 'Details(subtotal: $subtotal, shipping: $shipping, shippingDiscount: $shippingDiscount)';
  }

  factory Details.fromMap(Map<String, dynamic> data) => Details(
        subtotal: data['subtotal'] as String?,
        shipping: data['shipping'] as String?,
        shippingDiscount: data['shipping_discount'],
      );
  factory Details.fromEntity(OrderEntity data) => Details(
        subtotal: data.cartEntity.clcTotal().toString(),
        shipping: data.clcShippingCost().toString(),
        shippingDiscount: data.clcShippingCost(),
      );

  Map<String, dynamic> toMap() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  
  factory Details.fromJson(String data) {
    return Details.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

 
 
 }
