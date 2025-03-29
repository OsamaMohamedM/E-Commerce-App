import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'AuthService.dart';

class FireBaseAuthService extends AuthService {
  @override
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  @override
  Future<Either<User, CustomException>> createUserWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left(credential.user!);
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
  Future<Either<User, CustomException>> signInUserWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left((credential.user!));
    } on FirebaseAuthException catch (e) {
      log('on FirebaseAuthException Sign In catch (e) ${e.toString()}');
      if (e.code == 'user-not-found') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      } else if (e.code == 'wrong-password') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
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

  @override
  Future<Either<User, CustomException>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return left((userCredential.user!));
    } on FirebaseAuthException catch (e) {
      log('on FirebaseAuthException Sign In with Google catch (e) ${e.toString()}');
      if (e.code == 'account-exists-with-different-credential') {
        return right(CustomException('حساب موجود بالفعل'));
      } else if (e.code == 'invalid-credential') {
        return right(CustomException('المعلومات المدخلة غير صحيحة'));
      } else if (e.code == 'operation-not-allowed') {
        return right(
            CustomException('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      } else if (e.code == 'user-disabled') {
        return right(CustomException('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'user-not-found') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      } else if (e.code == 'wrong-password') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      }
    } catch (e) {
      log('on FirebaseAuthException Sign In with Google catch (e) ${e.toString()}');
      return right(CustomException('لقد حدث خطأ ما'));
    }
    return right(CustomException('لقد حدث خطأ ما'));
  }

  @override
  Future<Either<User, CustomException>> signInWithApple() async {
    try {
      // Implement Apple sign-in logic here
      // For example, using `sign_in_with_apple` package
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return left((userCredential.user!));
    } on FirebaseAuthException catch (e) {
      log('on FirebaseAuthException Sign In with Apple catch (e) ${e.toString()}');
      if (e.code == 'account-exists-with-different-credential') {
        return right(CustomException('حساب موجود بالفعل'));
      } else if (e.code == 'invalid-credential') {
        return right(CustomException('المعلومات المدخلة غير صحيحة'));
      } else if (e.code == 'operation-not-allowed') {
        return right(
            CustomException('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      } else if (e.code == 'user-disabled') {
        return right(CustomException('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'user-not-found') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      } else if (e.code == 'wrong-password') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      }
    } catch (e) {
      log('on Sign In with Apple catch (e) ${e.toString()}');
      return right(CustomException('لقد حدث خطأ ما'));
    }
    return right(CustomException('لقد حدث خطأ ما'));
  }

  @override
  Future<Either<User, CustomException>> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      final facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);
      final userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return left((userCredential.user!));
    } on FirebaseAuthException catch (e) {
      log('on FirebaseAuthException Sign In with Facebook catch (e) ${e.toString()}');
      if (e.code == 'account-exists-with-different-credential') {
        return right(CustomException('حساب موجود بالفعل'));
      } else if (e.code == 'invalid-credential') {
        return right(CustomException('المعلومات المدخلة غير صحيحة'));
      } else if (e.code == 'operation-not-allowed') {
        return right(
            CustomException('تسجيل الدخول بالبريد الإلكتروني غير مفعل'));
      } else if (e.code == 'user-disabled') {
        return right(CustomException('تم تعطيل حساب المستخدم'));
      } else if (e.code == 'user-not-found') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      } else if (e.code == 'wrong-password') {
        return right(
            CustomException('البريد الالكتروني أو كلمة المرور غير صحيحة'));
      }
    } catch (e) {
      log('on Sign In with Facebook catch (e) ${e.toString()}');
      return right(CustomException('لقد حدث خطأ ما'));
    }
    return right(CustomException('لقد حدث خطأ ما'));
  }

  @override
  bool isLogin() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
