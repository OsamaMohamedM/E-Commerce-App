import 'Order.dart';
import 'amount.dart';
import 'item_list.dart';

class PaymentEntity {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaymentEntity({this.amount, this.description, this.itemList});


  factory PaymentEntity.fromMap(Map<String, dynamic> data) {
    return PaymentEntity(
      amount: data['amount'] == null
          ? null
          : Amount.fromMap(data['amount'] as Map<String, dynamic>),
      description: data['description'] as String?,
      itemList: data['item_list'] == null
          ? null
          : ItemList.fromMap(data['item_list'] as Map<String, dynamic>),
    );
  }
  
  
  factory PaymentEntity.fromEntity(OrderEntity data) {
    return PaymentEntity(
      amount:  Amount.fromEntity(data),
      description:"Payment for FruitApp order.",
      itemList:  ItemList.fromEntity(data.cartEntity.cartItemEntityList)
    );
  }

  Map<String, dynamic> toMap() => {
        'amount': amount?.toMap(),
        'description': description,
        'item_list': itemList?.toMap(),
      };

}
