import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Exceptions.dart';
import 'package:e_commerce/Core/errors/Faluir.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'AuthService.dart';

class FireBaseAuthService extends AuthService {
  @override
  Future<Either<UserData, CustomException>> createUserWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left(UserData.fromFirebase(credential.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        right(CustomException('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        right(CustomException('The account already exists for that email.'));
      }
    } catch (e) {
      return right(CustomException(e.toString()));
    }
    return right(CustomException('An unknown error occurred.'));
  }
}
