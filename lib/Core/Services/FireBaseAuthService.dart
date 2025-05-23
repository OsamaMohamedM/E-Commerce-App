import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/Core/Services/SharedPrefrences.dart';
import 'package:e_commerce/Core/errors/AuthError.dart';
import 'package:e_commerce/Core/errors/Exceptions.dart';
import 'package:e_commerce/Core/utils/constants/BackEndEndPoints.dart';
import 'package:e_commerce/Core/utils/constants/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'AuthService.dart';

class FireBaseAuthService extends AuthService {
  final DataBaseService db;
  FireBaseAuthService({required this.db});
  @override
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  @override
  Future<Either<User, CustomException>> createUserWithEmailPassword(
      {required String email, required String password}) async {
    try {
      log(email + password);
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

  @override
  Future<Either<AuthFailure, void>> updateProfile({
    String? displayName,
    String? newEmail,
    String? newPassword,
    String? currentPassword,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return left(NotAuthenticated());
      }

      if ((newEmail != null || newPassword != null) &&
          currentPassword != null) {
        final cred = EmailAuthProvider.credential(
          email: 'ososomo242@gmail.com',
          password: currentPassword,
        );
        log(currentPassword.toString());
        log(user.email.toString());
        await user.reauthenticateWithCredential(cred);
      }


      if (newEmail != null) {

        await user.verifyBeforeUpdateEmail(newEmail);
      }

      if (newPassword!.isNotEmpty) {
        await user.updatePassword(newPassword);
      }
      await db.updateData(
        BackEndEndPoints.users,
        user.uid,
        {
          'name': displayName ?? user.displayName,
          'photoUrl': user.photoURL,
        },
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'محتاج إعادة المصادقة') {
        return left(ReauthRequired());
      }
      return left(ServerFailure(e.message ?? 'حدث خطا ما'));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    await SharedPreferencesHelper.remove(userPref);
    await FirebaseAuth.instance.signOut();
  }
  
}
