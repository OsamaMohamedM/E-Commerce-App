import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Failure.dart';

import '../entity/User.dart';

abstract class AuthRepo {
  Future<Either<UserData, Failure>> createUserWithEmailPassword(
      {required String email, required String password , required String name});
}
