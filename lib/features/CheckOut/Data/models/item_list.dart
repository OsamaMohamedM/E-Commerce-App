import 'dart:convert';

import 'package:e_commerce/features/Cart/Data/models/CartItem.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  @override
  String toString() => 'ItemList(items: $items)';

  factory ItemList.fromMap(Map<String, dynamic> data) => ItemList(
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  factory ItemList.fromEntity(List<CartItemEntity> data) => ItemList(
        items:
            data.map((e) => Item.fromEntity(e)).toList(),
      );

  Map<String, dynamic> toMap() => {
        'items': items?.map((e) => e.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());
}
