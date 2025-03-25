part of 'ProductCubit.dart';

abstract class ProductCubitState {}

class ProductCubitInitial extends ProductCubitState {}

class ProductCubitLoading extends ProductCubitState {}

class ProductCubitSuccess extends ProductCubitState {
  final List<ProductEntity> products;
  ProductCubitSuccess(this.products);
}

class ProductCubitFailure extends ProductCubitState {
  String message;
  ProductCubitFailure(this.message);
}
