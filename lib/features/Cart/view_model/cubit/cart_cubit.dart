import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/models/CartEntity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartEntity cartEntity;
  UserData? userData;
  CartCubit(this.cartEntity, {this.userData}) : super(CartInitial());

  void addToCart(ProductEntity cartProductItem, {int? counter}) {
    cartEntity.addItem(cartProductItem, counter: counter);

    emit(CartItemAdded());
  }

  void removeFromCart(ProductEntity cartProductItem) {
    cartEntity.removeItem(cartProductItem);
    emit(CartItemRemoved());
  }

  void decreaseFromCart(ProductEntity cartProductItem) {
    cartEntity.decreaseItem(cartProductItem);
    emit(CartItemDecrease());
  }

  int getNumberOfItems() {
    return cartEntity.cartItemEntityList.length;
  }

  void clearCart() {
    cartEntity.clear();
  }

  
}
