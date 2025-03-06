import 'package:e_commerce/Core/Services/FireBaseAuthService.dart';
import 'package:e_commerce/features/Auth/Data/repos/AuthRepoImp.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/domain/repos/authRepo.dart';
import '../Services/AuthService.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthService>(FireBaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(authService: getIt<AuthService>()));
  }
 