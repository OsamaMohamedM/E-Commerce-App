import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';
import 'package:e_commerce/Core/Data/Repo/ProductRepo.dart';
import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/Core/errors/Failure.dart';

import '../../errors/ServerFailure.dart';
import '../../utils/constants/BackEndEndPoints.dart';

class ProductRepoImp extends ProductRepo {
  final DataBaseService db;

  ProductRepoImp({required this.db});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await db.getData(BackEndEndPoints.products);
      log(data.toString());
      return Right(data.map((e) => ProductEntity.fromMap(e)).toList());
    } catch (e) {
      return Left(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getSelling() async {
    try {
      var data = await db.getData(BackEndEndPoints.products);
      var products = data.map((e) => ProductEntity.fromMap(e)).toList();

      products.sort((a, b) => b.numSelling.compareTo(a.numSelling));

      return Right(products);
    } catch (e) {
      return Left(Serverfailure(e.toString()));
    }
  }
}
