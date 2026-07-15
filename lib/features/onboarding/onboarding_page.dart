import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'onboarding_data.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();

  int currentPage = 0;

  bool get isLastPage => currentPage == onboardingPages.length - 1;

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xffFFFDFE),
            AppColors.background,
          ],
        ),
      ),
      child: Stack(
        children: [
          // Halo haut
          Positioned(
            top: -120,
            right: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary.withOpacity(.18),
              ),
            ),
          ),

          // Halo bas
          Positioned(
            bottom: -140,
            left: -100,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondary.withOpacity(.12),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.go(AppRoutes.login);
                      },
                      child: Text(
                        "Ignorer",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: onboardingPages.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final page = onboardingPages[index];

                        return Column(
                          children: [
                            SizedBox(
                              height: size.height * .48,
                              child: AnimatedScale(
                                duration: const Duration(milliseconds: 350),
                                scale: currentPage == index ? 1 : .95,
                                child: Image.asset(
                                  page.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              page.title,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.heading.copyWith(
                                fontSize: 31,
                                color: AppColors.primary,
                                height: 1.2,
                              ),
                            ),

                            const SizedBox(height: 18),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                page.description,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.body.copyWith(
                                  fontSize: 16,
                                  height: 1.7,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),

                            const Spacer(),
                          ],
                        );
                      },
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: onboardingPages.length,
                    effect: WormEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: Colors.grey.shade300,
                      dotHeight: 9,
                      dotWidth: 9,
                      spacing: 10,
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: 230,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        if (isLastPage) {
                          context.go(AppRoutes.login);
                        } else {
                          _controller.nextPage(
                            duration:
                                const Duration(milliseconds: 350),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        isLastPage
                            ? "Commencer"
                            : "Suivant",
                        style: AppTextStyles.button,
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}