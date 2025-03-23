import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Data/Model/Product.dart';
import 'package:e_commerce/Core/errors/Failure.dart';

abstract class ProductRepo {
  Future<Either<Failure,List<Product>>>getProducts();
  Future<Either<Failure,List<Product>>>getSelling();
}