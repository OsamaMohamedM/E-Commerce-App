import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Failure.dart';

import '../../Data/entity/User.dart';

abstract class AuthRepo {
  Future<Either<UserData, Failure>> createUserWithEmailPassword(
      {required String email, required String password});
}
