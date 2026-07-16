import 'package:go_router/go_router.dart';
import 'package:shewins_mobile/features/tracking/emotion/pages/create_emotion_page.dart';
import 'package:shewins_mobile/features/tracking/food/pages/food_page.dart';

import '../../core/constants/app_routes.dart';
import '../../features/onboarding/onboarding_page.dart';
import '../../features/splash/splash_page.dart';
import '../../features/auth/login/login_page.dart';
import '../../features/auth/register/register_page.dart';
import '../../features/profile/pages/complete_profile_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/tracking/cycle/pages/cycle_profile_page.dart';
import '../../features/tracking/cycle/pages/my_cycles_page.dart';
import '../../features/tracking/cycle/pages/start_cycle_page.dart';
import '../../features/tracking/cycle/pages/cycle_details_page.dart';
import '../../features/tracking/symptom/pages/symptom_page.dart';
import '../../features/tracking/symptom/pages/create_symptom_page.dart';
import '../../features/tracking/emotion/pages/emotion_page.dart';
import '../../features/tracking/food/pages/create_food_page.dart';

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
      GoRoute(
        path: AppRoutes.completeProfile,
        builder: (context, state) => const CompleteProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: AppRoutes.cycleProfile,
        builder: (context, state) => const CycleProfilePage(),
      ),

      GoRoute(
        path: AppRoutes.myCycles,
        builder: (context, state) => const MyCyclesPage(),
      ),

      GoRoute(
        path: AppRoutes.startCycle,
        builder: (context, state) => const StartCyclePage(),
      ),

      GoRoute(
        path: AppRoutes.cycleDetails,
        builder: (context, state) => const CycleDetailsPage(),
      ),
      GoRoute(
        path: AppRoutes.symptoms,
        builder: (context, state) => const SymptomPage(),
      ),

      GoRoute(
        path: AppRoutes.createSymptom,
        builder: (context, state) => const CreateSymptomPage(),
      ),
      GoRoute(
        path: AppRoutes.emotions,
        builder: (context, state) => const EmotionPage(),
      ),

      GoRoute(
        path: AppRoutes.createEmotion,
        builder: (context, state) => const CreateEmotionPage(),
      ),
      GoRoute(
        path: AppRoutes.foods,
        builder: (context, state) => const FoodPage(),
      ),

      GoRoute(
        path: AppRoutes.createFood,
        builder: (context, state) => const CreateFoodPage(),
      ),
    ],
  );
}
