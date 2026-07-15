import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

class SheWinsApp extends StatelessWidget {
  const SheWinsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SheWins',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}