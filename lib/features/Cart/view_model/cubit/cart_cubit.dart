import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/models/CartEntity.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
 CartEntity cartEntity ;
  CartCubit(this.cartEntity) : super(CartInitial());

  void addToCart(ProductEntity cartProductItem) {
    cartEntity.addItem(cartProductItem);
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
  int getNumberOfItems()
  {
    return cartEntity.cartItemEntityList.length;
  }
}
