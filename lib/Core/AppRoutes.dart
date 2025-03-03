import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../features/Auth/Login/Presentation/views/LoginView.dart';
import '../features/onBoarding/presentation/views/onBoardingView.dart';

class Approutes {
  static const String splash = '/';
  static const String onBoardingView = '/onBoardingView';
  static const String loginView = '/LoginView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: splash , builder: (context, state) =>const SplashView() ,),
    GoRoute(path: onBoardingView , builder: (context, state) =>const OnBoardingView() ,),
    GoRoute(path: loginView , builder: (context, state) =>const LoginView() ,)
  ]);
}
