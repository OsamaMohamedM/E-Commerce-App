import 'dart:convert';
import '../../../Cart/Data/models/CartItem.dart';

class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  @override
  String toString() {
    return 'Item(name: $name, quantity: $quantity, price: $price, currency: $currency)';
  }

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        name: data['name'] as String?,
        quantity: data['quantity'] as int?,
        price: data['price'] as String?,
        currency: data['currency'] as String?,
      );
  
  
  
  factory Item.fromEntity(CartItemEntity data) => Item(
        name: data.product.name ,
        quantity: data.count ,
        price: data.product.price.toString(),
        currency: 'USD' ,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };


  String toJson() => json.encode(toMap());

}
