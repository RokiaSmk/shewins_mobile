import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../nutrition/providers/nutrition_notifier.dart';
import '../prediction/providers/prediction_notifier.dart';
import '../statistics/providers/statistics_notifier.dart';
import '../health_insight/providers/health_insight_notifier.dart';

import '../../reports/providers/report_notifier.dart';

import '../../dashboard/widgets/prediction_card.dart';
import '../../dashboard/widgets/nutrition_analysis_card.dart';
import '../../dashboard/widgets/insight_card.dart';
import '../../dashboard/widgets/statistics_card.dart';
import '../../dashboard/widgets/medical_report_card.dart';

class AnalyticsPage extends ConsumerStatefulWidget {
  const AnalyticsPage({super.key});

  @override
  ConsumerState<AnalyticsPage> createState() =>
      _AnalyticsPageState();
}

class _AnalyticsPageState
    extends ConsumerState<AnalyticsPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(_refreshAnalytics);
  }

  Future<void> _refreshAnalytics() async {
    await Future.wait([
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
          .read(reportProvider.notifier)
          .loadReports(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF8F5FA),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Analyses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: _refreshAnalytics,
        child: SingleChildScrollView(
          physics:
              const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              Text(
                "Consultez vos analyses et recommandations personnalisées.",
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),

              SizedBox(height: 24),

              PredictionCard(),

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
    );
  }
}