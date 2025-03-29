import 'package:bloc/bloc.dart';
import 'package:e_commerce/Core/Data/Repo/ProductRepo.dart';

import '../../../../../Core/Data/Model/ProductEntity.dart';

part 'ProductCubitState.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  final ProductRepo productRepo;
  int productLength = 0;

  ProductCubit(this.productRepo) : super(ProductCubitInitial());

  Future<void> getProducts() async {
    emit(ProductCubitLoading());
    var result = await productRepo.getProducts();
    result.fold((l) => emit(ProductCubitFailure(l.message)),
        (r) => emit(ProductCubitSuccess(r)));
  }

  Future<void> getBestSelling() async {
    emit(ProductCubitLoading());
    var result = await productRepo.getSelling();
    result.fold((l) => emit(ProductCubitFailure(l.message)), (r) {
      productLength = r.length;
      emit(ProductCubitSuccess(r));
    });
  }
}
