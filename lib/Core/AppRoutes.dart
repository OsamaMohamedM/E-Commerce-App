import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class Approutes {
  static const String splash = '/';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: splash , builder: (context, state) =>const SplashView() ,)
  ]);
}
