import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Failure.dart';
import 'package:e_commerce/Core/utils/constants/BackEndEndPoints.dart';
import 'package:e_commerce/features/CheckOut/Data/Repo/OrderRepo.dart';
import 'package:e_commerce/features/CheckOut/Data/models/Order.dart';

import '../../../../Core/Services/DataBaseService.dart';
import '../../../../Core/errors/DateBaseFailure.dart';

class OrderRepoImp extends OrderRepo {
  final DataBaseService db;
  OrderRepoImp(this.db);
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity order) async {
    try {
      await db.addData(BackEndEndPoints.orders, order.toJson());
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
