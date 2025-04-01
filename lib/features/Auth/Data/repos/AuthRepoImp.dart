import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Services/AuthService.dart';
import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/Core/errors/Failure.dart';
import 'package:e_commerce/Core/errors/ServerFailure.dart';
import 'package:e_commerce/Core/utils/constants/BackEndEndPoints.dart';
import 'package:e_commerce/Core/utils/constants/strings.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';
import 'package:e_commerce/features/Auth/Data/repos/authRepo.dart';

import '../../../../Core/Services/SharedPrefrences.dart';

class AuthRepoImp extends AuthRepo {
  final AuthService authService;
  final DataBaseService db;

  AuthRepoImp({required this.db, required this.authService});

  @override
  Future<Either<UserData, Failure>> createUserWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result = await authService.createUserWithEmailPassword(
        email: email,
        password: password,
      );
      return await result.fold(
        (user) async {
          UserData userData = UserData(
              name: name, password: password, email: email, id: user.uid);
          return await _handleUserCreation(userData);
        },
        (failure) => right(Serverfailure(failure.message)),
      );
    } catch (e, stackTrace) {
      log('Exception in createUserWithEmailPassword: ${e.toString()}');
      log(stackTrace.toString());
      return right(Serverfailure(e.toString()));
    }
  }

  Future<Either<UserData, Failure>> _handleUserCreation(UserData user) async {
    try {
      await addUser(data: user.toMap());
      return left(user);
    } catch (dbError) {
      await authService.deleteUser();
      log('Error adding user to DB, user deleted from Firebase: ${dbError.toString()}');
      return right(Serverfailure('Failed to save user data. User deleted.'));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authService.signInUserWithEmailPassword(
        email: email,
        password: password,
      );

      return await result.fold(
        (user) async {
          UserData userData = UserData(
              id: user.uid, email: email, password: password, name: "");
          return await _handleUserLogin(userData);
        },
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth  ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInWithGoogle() async {
    try {
      final result = await authService.signInWithGoogle();

      return await result.fold(
        (user) async {
          UserData userData = UserData(
              id: user.uid,
              email: user.email!,
              password: "",
              name: user.displayName ?? "");
          return await _handleUserLogin(userData);
        },
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInWithApple() async {
    try {
      final result = await authService.signInWithApple();

      return await result.fold(
        (user) async {
          UserData userData = UserData(
              id: user.uid,
              email: user.email!,
              password: "",
              name: user.displayName ?? "");
          return await _handleUserLogin(userData);
        },
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInWithFacebook() async {
    try {
      final result = await authService.signInWithFacebook();

      return await result.fold(
        (user) async {
          UserData userData = UserData(
              id: user.uid,
              email: user.email!,
              password: "",
              name: user.displayName ?? "");
          return await _handleUserLogin(userData);
        },
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
  }

  Future<Either<UserData, Failure>> _handleUserLogin(UserData user) async {
    try {
      await addUser(data: user.toMap());
       await saveLocalData(userData: user);
      return left(user);
    } catch (dbError) {
      log('Error adding user to DB after login: ${dbError.toString()}');
      return right(Serverfailure('Failed to update user data.'));
    }
  }

  @override
  Future<void> addUser({required Map<String, dynamic> data}) async {
    if (data.isEmpty) return;
    try {
      await db.addData(BackEndEndPoints.users, data);
      log('User added to database successfully.');
    } catch (e) {
      log('Error in addUser: ${e.toString()}');
      throw Exception("Failed to add user to database: ${e.toString()}");
    }
  }

  Future saveLocalData({required UserData userData}) async {
    await SharedPreferencesHelper.setMap(userPref, userData.toMap());
  }
}
