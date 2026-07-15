import 'package:go_router/go_router.dart';

import '../../core/constants/app_routes.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/auth/login/login_page.dart';
import '../../features/auth/register/register_page.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterPage(),
      ),
    ],
  );
}
