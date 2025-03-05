import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Faluir.dart';

import '../../Data/entity/User.dart';

abstract class AuthRepo {
  Future<Either<User, Failure>> createUserWithEmailPassword(
      {required String email, required String password});
}
