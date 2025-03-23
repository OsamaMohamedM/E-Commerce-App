import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../errors/Exceptions.dart';

abstract class AuthService {
  Future<Either<User, CustomException>> createUserWithEmailPassword(
      {required String email, required String password});
  Future<Either<User, CustomException>> signInUserWithEmailPassword(
      {required String email, required String password});

  Future<Either<User, CustomException>> signInWithGoogle();
  Future<Either<User, CustomException>> signInWithFacebook();
  Future<Either<User, CustomException>> signInWithApple();
  Future deleteUser();
  bool isLogin();
}
