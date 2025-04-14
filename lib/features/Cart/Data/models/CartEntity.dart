import '../../../../Core/Data/Model/ProductEntity.dart';
import 'CartItem.dart';

class CartEntity {
  List<CartItemEntity> cartItemEntityList ;


  CartEntity({required this.cartItemEntityList });

  void addItem(ProductEntity product , {int? counter}) {
    int index = findProduct(product);
    if (index == -1) {
      CartItemEntity cartItemEntity =
          CartItemEntity(product: product, count: counter ?? 1);
      cartItemEntityList.add(cartItemEntity);
    } else {
      cartItemEntityList[index].count++;
    }
  }

  int findProduct(ProductEntity product) {
    for (int i = 0; i < cartItemEntityList.length; i++) {
      if (cartItemEntityList[i].product == product) {
        return i;
      }
    }
    return -1;
  }

  void removeItem(ProductEntity product) {
    int index = findProduct(product);
    if (index != -1) {
      cartItemEntityList.removeAt(index);
    }
  }

  void decreaseItem(ProductEntity product) {
    int index = findProduct(product);
    if (index != -1) {
      cartItemEntityList[index].count--;
      if (cartItemEntityList[index].count == 0) {
        cartItemEntityList.removeAt(index);
      }
    }
  }

  num clcTotal() {
    num total = 0;
    for (int i = 0; i < cartItemEntityList.length; i++) {
      total += cartItemEntityList[i].clcPrice();
    }
    return total;
  }

  Map<String, dynamic> toJson() {
    return {
      'cartItemEntityList':
          cartItemEntityList.map((item) => item.toJson()).toList(),
    };
  }

  void clear()
  {
    cartItemEntityList.clear();
    
  }

  int ClcCount() {
    int count = 0;
    for (int i = 0; i < cartItemEntityList.length; i++) {
      count += cartItemEntityList[i].count;
    }
    return count;
  }
}
