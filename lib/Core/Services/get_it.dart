import 'package:e_commerce/Core/Data/Repo/ProductRepo.dart';
import 'package:e_commerce/Core/Data/Repo/ProductRepoImp.dart';
import 'package:e_commerce/Core/Services/DataBaseService.dart';
import 'package:e_commerce/Core/Services/FireBaseAuthService.dart';
import 'package:e_commerce/Core/Services/FireStoreService.dart';
import 'package:e_commerce/features/Auth/Data/repos/AuthRepoImp.dart';
import 'package:e_commerce/features/CheckOut/Data/Repo/OrderRepo.dart';
import 'package:e_commerce/features/CheckOut/Data/Repo/OrderRepoImp.dart';
import 'package:e_commerce/features/Profile/data/Repo/OrderHistoryRepo.dart';
import 'package:get_it/get_it.dart';

import '../../features/Auth/Data/repos/authRepo.dart';
import 'AuthService.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DataBaseService>(FirestoreService());
  getIt.registerSingleton<OrderHistoryRepo>(OrderHistoryRepo( dataBaseService:getIt.get<DataBaseService>()));
  getIt.registerSingleton<AuthService>(FireBaseAuthService(
      db: getIt<DataBaseService>(),
  ));
  
  getIt.registerSingleton<AuthRepo>(AuthRepoImp(
      authService: getIt<AuthService>(), db: getIt<DataBaseService>()));
  getIt.registerSingleton<ProductRepo>(
      ProductRepoImp(db: getIt<DataBaseService>()));
  getIt.registerSingleton<OrderRepo>(OrderRepoImp(getIt<DataBaseService>()));
  
}
