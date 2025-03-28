import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/CheckOut/Data/models/Order.dart';

import '../../../../Core/errors/Failure.dart';

abstract class OrderRepo{
  Future<Either<Failure, void>> addOrder(OrderEntity order);
}