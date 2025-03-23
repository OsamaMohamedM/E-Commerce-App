import 'package:e_commerce/Core/Services/get_it.dart';
import 'package:e_commerce/features/Auth/Presentation/views/SignUp.dart';
import 'package:e_commerce/features/Home/Presentation/views/MainView.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce/features/Auth/Presentation/views/LoginView.dart';
import 'package:e_commerce/features/onBoarding/presentation/views/onBoardingView.dart';
import 'package:go_router/go_router.dart';
import 'Services/AuthService.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onBoardingView = '/onBoardingView';
  static const String loginView = '/LoginView';
  static const String signUpView = '/signUpView';
  static const String homeView = '/homeView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => const SplashView()),
      GoRoute(
          path: onBoardingView,
          builder: (context, state) => const OnBoardingView()),
      GoRoute(path: loginView, builder: (context, state) => const LoginView()),
      GoRoute(path: signUpView, builder: (context, state) => const SignUp()),
      GoRoute(path: homeView, builder: (context, state) => const MainView()),
    ],
    redirect: (context, state) {
      final bool isLoggedIn = getIt.get<AuthService>().isLogin();
      if (isLoggedIn) {
        return homeView;
      } else {
        return loginView;
      }
    },
  );
}
