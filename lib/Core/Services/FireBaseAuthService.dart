import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Exceptions.dart';
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
      log('on FirebaseAuthException Sign Up with email and password catch (e) ${e.toString()}');
      if (e.code == 'weak-password') {
        return right(CustomException('لقد ادخلت كلمة مرور ضعيفة'));
      } else if (e.code == 'email-already-in-use') {
        return right(CustomException('البريد الالكتروني مستخدم بالفعل'));
      }
    } catch (e) {
      log('on  Sign Up with email and password catch (e) ${e.toString()}');
      return right(CustomException('لقد حدث خطأ ما'));
    }
    return right(CustomException('حدث خطأ ما'));
  }

  @override
  Future<Either<UserData, CustomException>> signInUserWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left(UserData.fromFirebase(credential.user!));
    } on FirebaseAuthException catch (e) {
      log('on FirebaseAuthException Sign In catch (e) ${e.toString()}');
      if (e.code == 'user-not-found') {
        return right(CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة' ));
      } else if (e.code == 'wrong-password') {
        return right(CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      } else if (e.code == 'user-disabled') {
        return right(CustomException('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'too-many-requests') {
        return right(
            CustomException('عدد كبير جدا من الطلبات. حاول مرة أخرى لاحقًا'));
      } else if (e.code == 'operation-not-allowed') {
        return right(
            CustomException('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      }
    } catch (e) {
      log('on Sign In catch (e) ${e.toString()}');
      return right(CustomException('لقد حدث خطأ ما'));
    }
    return right(CustomException('لقد حدث خطأ ما'));
  }
}
