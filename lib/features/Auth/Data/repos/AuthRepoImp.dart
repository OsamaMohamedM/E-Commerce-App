import 'package:dartz/dartz.dart';
import 'package:e_commerce/Core/Services/FireBaseAuthService.dart';
import 'package:e_commerce/Core/errors/Faluir.dart';
import 'package:e_commerce/features/Auth/Data/entity/User.dart';
import 'package:e_commerce/features/Auth/domain/repos/authRepo.dart';

class AuthRepoImp extends AuthRepo {
  final FireBaseAuthService fireBaseAuthService;
   
  AuthRepoImp({required this.fireBaseAuthService});
  @override
  Future<Either<User, Failure>> createUserWithEmailPassword({required String email, required String password}) {
    var reponse =  fireBaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
    //return reponse;
  }
}
