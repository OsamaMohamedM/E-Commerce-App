import '../../../../Core/Data/Model/ProductEntity.dart';
import 'orderProductModel.dart';

class CartItemEntity {
  final ProductEntity product;
  int count;

  CartItemEntity({
    required this.product,
    this.count = 0,
  });

  num clcPrice() {
    return product.price * count;
  }

  num clcWeight() {
    return product.unitAmount * count;
  }

  @override
  bool operator ==(Object cartItemEntity) {
    if (cartItemEntity is CartItemEntity) {
      return cartItemEntity.product == product;
    }
    return false;
  }

  toJson() => {'product': OrderProductModel.fromEntity(this), 'count': count};
}
