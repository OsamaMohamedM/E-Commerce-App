import 'dart:convert';

import 'package:e_commerce/features/CheckOut/Data/models/Order.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  Details? details;

  Amount({this.total, this.currency, this.details});

  factory Amount.fromMap(Map<String, dynamic> data) => Amount(
        total: data['total'] as String?,
        currency: data['currency'] as String?,
        details: data['details'] == null
            ? null
            : Details.fromMap(data['details'] as Map<String, dynamic>),
      );
  
  
  
  
  
  factory Amount.fromEntity(OrderEntity data) => Amount(
        total: data.CalculateAllPrice().toString(),
        currency: 'USD',
        details: Details.fromEntity(data),
      );





  Map<String, dynamic> toMap() => {
        'total': total,
        'currency': currency,
        'details': details?.toMap(),
      };

  factory Amount.fromJson(String data) {
   return Amount.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  
}
