import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../tracking/cycle/providers/cycle_notifier.dart';
import '../../../tracking/symptom/providers/symptom_notifier.dart';
import '../../../tracking/emotion/providers/emotion_notifier.dart';
import '../../../tracking/food/providers/food_notifier.dart';
import '../../widgets/cycle_card.dart';
import '../../widgets/dashboard_header.dart';
import '../../widgets/emotion_card.dart';
import '../../widgets/food_card.dart';
import '../../widgets/health_overview_card.dart';
import '../../widgets/insight_card.dart';
import '../../widgets/quick_actions_card.dart';
import '../../widgets/statistics_card.dart';
import '../../widgets/symptom_card.dart';
import '../../widgets/nutrition_analysis_card.dart';
import '../../../analytics/nutrition/providers/nutrition_notifier.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await ref.read(cycleProvider.notifier).loadCycleProfile();
      await ref.read(cycleProvider.notifier).loadCycles();
      await ref.read(symptomProvider.notifier).loadMemberSymptoms();
      await ref.read(emotionProvider.notifier).loadMemberEmotions();
      await ref.read(foodProvider.notifier).loadMemberFoodJournals();
      await ref.read(nutritionProvider.notifier).loadNutritionAnalysis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF8F5FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardHeader(),

              SizedBox(height: 24),

              HealthOverviewCard(),

              SizedBox(height: 24),

              CycleCard(),

              SymptomCard(),

              EmotionCard(),

              FoodCard(),

              NutritionAnalysisCard(),

              InsightCard(),

              StatisticsCard(),

              QuickActionsCard(),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
