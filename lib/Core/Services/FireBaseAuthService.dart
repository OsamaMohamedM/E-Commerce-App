import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/errors/Exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
class FireBaseAuthService {
  Future<Either<User, CustomException>> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return left(credential.user!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        right(CustomException('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        right(CustomException('The account already exists for that email.'));
      }
    } catch (e) {
      return right(CustomException(e.toString()) );
    }
    return right(CustomException('An unknown error occurred.'));
  }
}
