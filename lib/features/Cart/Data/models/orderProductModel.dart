import 'CartItem.dart';

class OrderProductModel {
  final String name;
  final String image;
  final int count;
  final num price;
  final String code;

  OrderProductModel(
      {required this.code,
      required this.name,
      required this.image,
      required this.count,
      required this.price});

  factory OrderProductModel.fromEntity(CartItemEntity entity) {
    return OrderProductModel(
      code: entity.product.code,
      name: entity.product.name,
      image: entity.product.image!,
      count: entity.count,
      price: entity.product.price,
    );
  }

  toJson() => {
        'name': name,
        'image': image,
        'count': count,
        'price': price,
        'code': code,
      };
}
