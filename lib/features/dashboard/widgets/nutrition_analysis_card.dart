import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_card.dart';
import '../../analytics/nutrition/providers/nutrition_notifier.dart';

class NutritionAnalysisCard extends ConsumerWidget {
  const NutritionAnalysisCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(nutritionProvider);
    final analysis = state.analysis;

    if (analysis == null) {
      return AppCard(
        title: "Analyse nutritionnelle",
        icon: Icons.restaurant_menu_rounded,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "Aucune analyse nutritionnelle n'est disponible pour le moment.",
              style: TextStyle(height: 1.5),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () {
                  ref
                      .read(
                        nutritionProvider.notifier,
                      )
                      .loadNutritionAnalysis();
                },
                icon: const Icon(
                  Icons.analytics_rounded,
                ),
                label: const Text(
                  "Générer une analyse",
                ),
              ),
            ),
          ],
        ),
      );
    }

    Color scoreColor;

    if (analysis.nutritionScore >= 80) {
      scoreColor = Colors.green;
    } else if (analysis.nutritionScore >= 60) {
      scoreColor = Colors.orange;
    } else {
      scoreColor = Colors.red;
    }

    return AppCard(
      title: "Analyse nutritionnelle",
      icon: Icons.restaurant_menu_rounded,
      child: Column(
        children: [

          _NutritionScoreCard(
            score: analysis.nutritionScore,
            color: scoreColor,
          ),

          const SizedBox(height: 20),

          Row(
            children: [

              Expanded(
                child: _NutritionMetricCard(
                  icon: Icons.monitor_heart,
                  title: "IG moyen",
                  value: analysis
                      .averageGlycemicIndex
                      .toStringAsFixed(1),
                  color: Colors.red,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _NutritionMetricCard(
                  icon: Icons.grass,
                  title: "Fibres",
                  value:
                      "${analysis.fiberScore.toStringAsFixed(0)} %",
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: _NutritionMetricCard(
                  icon: Icons.fitness_center,
                  title: "Protéines",
                  value:
                      "${analysis.proteinScore.toStringAsFixed(0)} %",
                  color: Colors.blue,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _NutritionMetricCard(
                  icon: Icons.spa,
                  title: "Anti-inflammatoire",
                  value:
                      "${analysis.antiInflammatoryScore.toStringAsFixed(0)} %",
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          _FoodSection(
            title: "Aliments recommandés",
            icon: Icons.check_circle,
            color: Colors.green,
            foods:
                analysis.recommendedFoods,
          ),

          const SizedBox(height: 18),

          _FoodSection(
            title: "À limiter",
            icon: Icons.warning_amber,
            color: Colors.orange,
            foods: analysis.foodsToLimit,
          ),

          const SizedBox(height: 18),

          _FoodSection(
            title: "À éviter",
            icon: Icons.cancel,
            color: Colors.red,
            foods: analysis.foodsToAvoid,
          ),

          const SizedBox(height: 22),

          const _NutritionFooter(),
        ],
      ),
    );
  }
}
class _NutritionScoreCard extends StatelessWidget {
  final double score;
  final Color color;

  const _NutritionScoreCard({
    required this.score,
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
            "Score nutritionnel",
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
                    "${score.toStringAsFixed(0)}%",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NutritionMetricCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _NutritionMetricCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<String> foods;

  const _FoodSection({
    required this.title,
    required this.icon,
    required this.color,
    required this.foods,
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
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor:
                    color.withOpacity(.15),
                child: Icon(
                  icon,
                  color: color,
                  size: 18,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          if (foods.isEmpty)
            const Text(
              "Aucune donnée disponible.",
            )
          else
            ...foods.map(
              (food) => Padding(
                padding:
                    const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: color,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(food),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _NutritionFooter extends StatelessWidget {
  const _NutritionFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
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
              color: Colors.green.shade700,
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  "Conseil nutritionnel",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Privilégiez une alimentation riche en fibres, en protéines de qualité et en aliments anti-inflammatoires afin d'améliorer votre équilibre hormonal et votre bien-être.",
                  style: TextStyle(
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