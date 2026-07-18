import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tracking/cycle/providers/cycle_notifier.dart';
import '../../../tracking/symptom/providers/symptom_notifier.dart';
import '../../../tracking/emotion/providers/emotion_notifier.dart';
import '../../../tracking/food/providers/food_notifier.dart';

import '../../../analytics/nutrition/providers/nutrition_notifier.dart';
import '../../../analytics/prediction/providers/prediction_notifier.dart';
import '../../../analytics/statistics/providers/statistics_notifier.dart';
import '../../../analytics/health_insight/providers/health_insight_notifier.dart';

import '../../../notifications/providers/notification_notifier.dart';
import '../../../reports/providers/report_notifier.dart';

import '../../widgets/dashboard_header.dart';
import '../../widgets/health_overview_card.dart';
import '../../widgets/quick_actions_card.dart';
import '../../widgets/prediction_card.dart';
import '../../widgets/cycle_card.dart';
import '../../widgets/symptom_card.dart';
import '../../widgets/emotion_card.dart';
import '../../widgets/food_card.dart';
import '../../widgets/nutrition_analysis_card.dart';
import '../../widgets/insight_card.dart';
import '../../widgets/statistics_card.dart';
import '../../widgets/medical_report_card.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() =>
      _DashboardPageState();
}

class _DashboardPageState
    extends ConsumerState<DashboardPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(_refreshDashboard);
  }

  Future<void> _refreshDashboard() async {
    await Future.wait([
      ref
          .read(cycleProvider.notifier)
          .loadCycleProfile(),

      ref
          .read(cycleProvider.notifier)
          .loadCycles(),

      ref
          .read(symptomProvider.notifier)
          .loadMemberSymptoms(),

      ref
          .read(emotionProvider.notifier)
          .loadMemberEmotions(),

      ref
          .read(foodProvider.notifier)
          .loadMemberFoodJournals(),

      ref
          .read(nutritionProvider.notifier)
          .loadNutritionAnalysis(),

      ref
          .read(predictionProvider.notifier)
          .loadLatestPrediction(),

      ref
          .read(statisticsProvider.notifier)
          .loadLatestStatistics(),

      ref
          .read(healthInsightProvider.notifier)
          .loadLatestHealthInsight(),

      ref
          .read(notificationProvider.notifier)
          .loadNotifications(),

      ref
          .read(notificationProvider.notifier)
          .loadUnreadNotifications(),

      ref
          .read(reportProvider.notifier)
          .loadReports(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshDashboard,
          child: SingleChildScrollView(
            physics:
                const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                DashboardHeader(),

                SizedBox(height: 24),

                HealthOverviewCard(),

                SizedBox(height: 24),

                QuickActionsCard(),

                SizedBox(height: 24),

                PredictionCard(),

                SizedBox(height: 20),

                CycleCard(),

                SizedBox(height: 20),

                SymptomCard(),

                SizedBox(height: 20),

                EmotionCard(),

                SizedBox(height: 20),

                FoodCard(),

                SizedBox(height: 20),

                NutritionAnalysisCard(),

                SizedBox(height: 20),

                InsightCard(),

                SizedBox(height: 20),

                StatisticsCard(),

                SizedBox(height: 20),

                MedicalReportCard(),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}