import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/Core/Services/FireBaseAuthService.dart';
import 'package:e_commerce/Core/Services/FireStoreService.dart';
import 'package:e_commerce/features/Auth/Data/repos/AuthRepoImp.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/Data/repos/authRepo.dart';
import 'AuthService.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthService>(FireBaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(authService: getIt<AuthService>(), 
    db: getIt<DataBaseService>()));
  }
 