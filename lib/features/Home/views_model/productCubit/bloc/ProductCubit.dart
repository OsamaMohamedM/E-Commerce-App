import 'dart:developer';


import 'package:e_commerce/Core/Data/Repo/ProductRepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/Data/Model/ProductEntity.dart';

part 'ProductCubitState.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  final ProductRepo productRepo;
  int BestSellingProductLength = 0;
  List<ProductEntity> products = [];

  ProductCubit(this.productRepo) : super(ProductCubitInitial());

  Future<void> getProducts() async {
    emit(ProductCubitLoading());
    var result = await productRepo.getProducts();
    result.fold((l) => emit(ProductCubitFailure(l.message)), (r) {
      products = r;
      emit(ProductCubitSuccess(r));
    });
  }

  Future<void> getBestSelling() async {
    emit(ProductCubitLoading());
    var result = await productRepo.getSelling();
    result.fold((l) => emit(ProductCubitFailure(l.message)), (r) {
      BestSellingProductLength = r.length;
      emit(ProductCubitSuccess(products));
    });
  }
}
