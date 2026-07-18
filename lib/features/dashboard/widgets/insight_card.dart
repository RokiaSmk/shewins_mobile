import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_card.dart';
import '../../analytics/health_insight/providers/health_insight_notifier.dart';

class InsightCard extends ConsumerWidget {
  const InsightCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      healthInsightProvider,
    );

    final insight = state.insight;

    if (insight == null) {
      return AppCard(
        title: "Analyse intelligente",
        icon: Icons.psychology_alt_rounded,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "SheWins peut analyser votre cycle, vos symptômes, votre humeur et votre alimentation afin de produire un bilan personnalisé.",
              style: TextStyle(height: 1.5),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(
                  Icons.auto_awesome,
                ),
                label: const Text(
                  "Générer mon analyse",
                ),
                onPressed: () async {
                  final notifier = ref.read(
                    healthInsightProvider.notifier,
                  );

                  await notifier.generateHealthInsight();

                  if (!context.mounted) return;

                  final state = ref.read(
                    healthInsightProvider,
                  );

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error == null
                            ? "✅ Analyse générée."
                            : "⚠️ ${state.error}",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    Color scoreColor;

    if (insight.globalHealthScore >= 80) {
      scoreColor = Colors.green;
    } else if (insight.globalHealthScore >= 60) {
      scoreColor = Colors.orange;
    } else {
      scoreColor = Colors.red;
    }

    return AppCard(
      title: "Analyse intelligente",
      icon: Icons.psychology_alt_rounded,
      child: Column(
        children: [

          _HealthScoreCard(
            score: insight.globalHealthScore,
            riskLevel: insight.riskLevel,
            color: scoreColor,
          ),

          const SizedBox(height: 22),

          _InsightTile(
            icon: Icons.calendar_month_rounded,
            color: Colors.pink,
            title: "Cycle",
            value: insight.cycleInsight,
          ),

          const SizedBox(height: 12),

          _InsightTile(
            icon: Icons.favorite_rounded,
            color: Colors.red,
            title: "Symptômes",
            value: insight.symptomInsight,
          ),

          const SizedBox(height: 12),

          _InsightTile(
            icon: Icons.restaurant_rounded,
            color: Colors.green,
            title: "Nutrition",
            value: insight.nutritionInsight,
          ),

          const SizedBox(height: 12),

          _InsightTile(
            icon: Icons.mood_rounded,
            color: Colors.amber,
            title: "Émotions",
            value: insight.emotionInsight,
          ),

          const SizedBox(height: 24),

          _RecommendationCard(
            recommendation:
                insight.generalRecommendation,
          ),
        ],
      ),
    );
  }
}
class _HealthScoreCard extends StatelessWidget {
  final int score;
  final String riskLevel;
  final Color color;

  const _HealthScoreCard({
    required this.score,
    required this.riskLevel,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text(
            "Score global de santé",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 18),

          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 110,
                height: 110,
                child: CircularProgressIndicator(
                  value: score / 100,
                  strokeWidth: 10,
                  backgroundColor: color.withOpacity(.15),
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ),

              Column(
                children: [
                  Text(
                    "$score",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const Text("/100"),
                ],
              ),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              riskLevel,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const _InsightTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: const TextStyle(
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  final String recommendation;

  const _RecommendationCard({
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.lightbulb_outline_rounded,
              color: Colors.deepPurple.shade400,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recommandation SheWins",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  recommendation,
                  style: const TextStyle(
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}