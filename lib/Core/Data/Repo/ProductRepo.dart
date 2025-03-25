import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:e_commerce/Core/errors/Failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getSelling();
}
