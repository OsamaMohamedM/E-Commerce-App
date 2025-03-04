import 'package:e_commerce/Core/AppRoutes.dart';
import 'package:e_commerce/Core/Services/SharedPrefrences.dart';
import 'package:e_commerce/Core/utils/styles/app_colors.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
