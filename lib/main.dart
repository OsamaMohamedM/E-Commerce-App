import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:e_commerce/Core/Services/AuthService.dart';
import 'package:e_commerce/Core/Services/SharedPrefrences.dart';
import 'package:e_commerce/Core/helpers/BlocObserver.dart';
import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Core/Services/get_it.dart';
import 'features/Cart/Data/models/CartEntity.dart';
import 'features/Cart/view_model/cubit/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();
  Bloc.observer = CustomBlocObserver();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(CartEntity(
        cartItemEntityList: [],
      )),
      child: MaterialApp.router(
        theme: ThemeData(
            fontFamily: 'Cairo',
            scaffoldBackgroundColor: Colors.white,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.darkPrimaryColor)),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
