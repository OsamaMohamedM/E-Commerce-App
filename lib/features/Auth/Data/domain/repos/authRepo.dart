import '../../entity/User.dart';

abstract class Authrepo {
   Future<User> createUserWithEmailPassword({required String email,required String password});
}