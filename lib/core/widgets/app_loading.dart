import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppLoading extends StatelessWidget {
  final double size;
  final String? message;

  const AppLoading({
    super.key,
    this.size = 30,
    this.message,
  });

  const AppLoading.small({
    super.key,
  })  : size = 22,
        message = null;

  const AppLoading.large({
    super.key,
  })  : size = 42,
        message = null;

  const AppLoading.fullScreen({
    super.key,
    this.message = "Chargement...",
  }) : size = 42;

  bool get _isFullScreen => message != null;

  @override
  Widget build(BuildContext context) {
    final loader = SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 2.8,
        color: AppColors.primary,
      ),
    );

    if (!_isFullScreen) {
      return loader;
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          loader,

          const SizedBox(height: 18),

          Text(
            message!,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}