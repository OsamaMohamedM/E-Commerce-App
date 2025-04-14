import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../errors/AuthError.dart';
import '../errors/Exceptions.dart';

abstract class AuthService {
  Future<Either<User, CustomException>> createUserWithEmailPassword(
      {required String email, required String password});
  Future<Either<User, CustomException>> signInUserWithEmailPassword(
      {required String email, required String password});

  Future<Either<User, CustomException>> signInWithGoogle();
  Future<Either<User, CustomException>> signInWithFacebook();
  Future<Either<User, CustomException>> signInWithApple();
  Future<Either<AuthFailure, void>> updateProfile({
    String? displayName,
    String? newEmail,
    String? newPassword,
    String? currentPassword,
  });
  Future deleteUser();
  Future<void> signOut();
  bool isLogin();
}
