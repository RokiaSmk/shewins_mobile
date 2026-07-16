import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_routes.dart';
import '../../core/storage/local_storage_service.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../auth/providers/auth_notifier.dart';
import '../profile/providers/profile_notifier.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>{
  bool _showLogo = false;
  bool _showTitle = false;
  bool _showSubtitle = false;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 250));

    if (!mounted) return;
    setState(() => _showLogo = true);

    await Future.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;
    setState(() => _showTitle = true);

    await Future.delayed(const Duration(milliseconds: 450));

    if (!mounted) return;
    setState(() => _showSubtitle = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final hasSeenOnboarding =
    await LocalStorageService.hasSeenOnboarding();

    if (!mounted) return;

    if (!hasSeenOnboarding) {
      context.go(AppRoutes.onboarding);
      return;
    }

    final user =
        await ref.read(authProvider.notifier).checkAuthentication();

    if (!mounted) return;

    if (user == null) {
    context.go(AppRoutes.login);
    return;
  }

  if (user.profileCompleted) {
    await ref
        .read(profileProvider.notifier)
        .loadProfile();

    if (!mounted) return;

    context.go(AppRoutes.dashboard);
  } else {
    context.go(AppRoutes.completeProfile);
  }

  context.go(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedScale(
                  scale: _showLogo ? 1 : .8,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeOutBack,
                  child: AnimatedOpacity(
                    opacity: _showLogo ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    child: Hero(
                      tag: "app_logo",
                      child: Image.asset(AppAssets.symbol, width: 220),
                    ),
                  ),
                ),

                const SizedBox(height: 2),

                AnimatedOpacity(
                  opacity: _showTitle ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  child: Text(
                    "SheWins",
                    style: AppTextStyles.heading.copyWith(
                      fontSize: 40,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                AnimatedOpacity(
                  opacity: _showSubtitle ? 1 : 0,
                  duration: const Duration(milliseconds: 700),
                  child: Text(
                    "Votre compagnon de santé féminine",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
