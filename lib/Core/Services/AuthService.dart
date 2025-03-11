import 'package:dartz/dartz.dart';

import '../../features/Auth/Data/entity/User.dart';
import '../errors/Exceptions.dart';

abstract class AuthService {
  Future<Either<UserData, CustomException>> createUserWithEmailPassword(
      {required String email, required String password});
  Future<Either<UserData, CustomException>> signInUserWithEmailPassword(
      {required String email, required String password});

  Future<Either<UserData , CustomException>> signInWithGoogle(); 
}
