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
import '../../features/notifications/pages/notification_page.dart';
import '../../features/reports/pages/report_page.dart';
import '../../features/community/publication/pages/community_page.dart';
import '../../features/community/publication/pages/create_publication_page.dart';
import '../../features/education/pages/education_detail_page.dart';
import '../../features/education/pages/education_page.dart';
import '../../features/education/models/education_response.dart';
import '../../features/main/pages/main_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../features/tracking/cycle/models/menstrual_cycle.dart';
import '../../features/education/models/education_response.dart';
import '../../features/settings/pages/settings_page.dart';
import '../../features/settings/pages/edit_profile_page.dart';
import '../../features/settings/pages/notification_settings_page.dart';
import '../../features/settings/pages/theme_page.dart';
import '../../features/settings/pages/privacy_page.dart';
import '../../features/settings/pages/help_page.dart';
import '../../features/settings/pages/about_page.dart';
import '../../features/settings/pages/delete_account_page.dart';

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
        builder: (context, state) => const MainPage(),
      ),
      /*GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),*/
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
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) =>
            const NotificationPage(),
      ),
      GoRoute(
        path: AppRoutes.reports,
        builder: (_, __) =>
            const ReportPage(),
      ),
      GoRoute(
        path: AppRoutes.community,
        builder: (_, __) => const CommunityPage(),
      ),

      GoRoute(
        path: AppRoutes.createPublication,
        builder: (_, __) => const CreatePublicationPage(),
      ),
      GoRoute(
        path: AppRoutes.education,
        builder: (context, state) => const EducationPage(),
      ),

      GoRoute(
        path: AppRoutes.educationDetail,
        builder: (context, state) => EducationDetailPage(
          article: state.extra as EducationResponse,
        ),
      ),
      GoRoute(
        path: AppRoutes.profile,
        builder: (_, __) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.main,
        builder: (_, __) => const MainPage(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (_, __) => const SettingsPage(),
      ),

      GoRoute(
        path: AppRoutes.editProfile,
        builder: (_, __) => const EditProfilePage(),
      ),

      GoRoute(
        path: AppRoutes.notificationSettings,
        builder: (_, __) => const NotificationSettingsPage(),
      ),

      GoRoute(
        path: AppRoutes.theme,
        builder: (_, __) => const ThemePage(),
      ),

      GoRoute(
        path: AppRoutes.privacy,
        builder: (_, __) => const PrivacyPage(),
      ),

      GoRoute(
        path: AppRoutes.help,
        builder: (_, __) => const HelpPage(),
      ),

      GoRoute(
        path: AppRoutes.about,
        builder: (_, __) => const AboutPage(),
      ),

      GoRoute(
        path: AppRoutes.deleteAccount,
        builder: (_, __) => const DeleteAccountPage(),
      ),
      GoRoute(
        path: AppRoutes.cycleDetails,
        builder: (context, state) => CycleDetailsPage(
          cycle: state.extra as MenstrualCycle,
        ),
      ),
    ],
  );
}
