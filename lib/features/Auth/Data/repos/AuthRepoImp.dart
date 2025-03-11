import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Services/AuthService.dart';
import 'package:e_commerce/Core/errors/Failure.dart';
import 'package:e_commerce/Core/errors/ServerFailure.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';
import 'package:e_commerce/features/Auth/Data/repos/authRepo.dart';

class AuthRepoImp extends AuthRepo {
  final AuthService authService;

  AuthRepoImp({required this.authService});
  @override
  @override
  Future<Either<UserData, Failure>> createUserWithEmailPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var result = await authService.createUserWithEmailPassword(
          email: email, password: password);

      return result.fold(
        (user) => left(user),
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth  ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
  }

  @override
  Future<Either<UserData, Failure>> signInUserWithEmailPassword(
      {required String email, required String password}) async {
    try {
      var result = await authService.signInUserWithEmailPassword(
          email: email, password: password);

      return result.fold(
        (user) => left(user),
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
      var result = await authService.signInWithGoogle();

      return result.fold(
        (user) => left(user),
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
  }
  
  @override
  Future<Either<UserData, Failure>> signInWithApple() async{
    try {
      var result = await authService.signInWithApple();

      return result.fold(
        (user) => left(user),
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
    
  }
  
  @override
  Future<Either<UserData, Failure>> signInWithFacebook() async{
    try {
      var result = await authService.signInWithFacebook();

      return result.fold(
        (user) => left(user),
        (exception) => right(Serverfailure(exception.message)),
      );
    } catch (e) {
      log('message from RepoAuth   ${e.toString()}');
      return right(Serverfailure(e.toString()));
    }
  }
}
