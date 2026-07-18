import 'package:flutter/material.dart';
import '../../tracking/pages/tracking_page.dart';
import '../../analytics/pages/analytics_page.dart';
import '../../education/pages/education_page.dart';
import '../../profile/pages/profile_page.dart';
import '../../dashboard/presentation/pages/dashboard_page.dart';

import '../widgets/app_bottom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  late final List<Widget> _pages = [
    const DashboardPage(),
    const TrackingPage(),
    const AnalyticsPage(),
    const EducationPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: AppBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
