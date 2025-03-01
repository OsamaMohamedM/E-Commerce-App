import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../features/onBoarding/presentation/views/onBoardingView.dart';

class Approutes {
  static const String splash = '/';
  static const String onBoardingView = '/onBoardingView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: splash , builder: (context, state) =>const SplashView() ,),
    GoRoute(path: splash , builder: (context, state) =>const OnBoardingView() ,)
  ]);
}
