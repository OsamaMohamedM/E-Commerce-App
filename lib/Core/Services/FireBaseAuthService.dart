import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Exceptions.dart';
import 'package:e_commerce/Core/errors/Failure.dart';
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
        right(CustomException('لقد ادخلت كلمة مرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        right(CustomException('البريد الالكتروني مستخدم بالفعل'));
      }
    } catch (e) {
      return right(CustomException('لقد حدث خطأ ما'));
    }
    return right(CustomException('حدث خطأ ما'));
  }
}
