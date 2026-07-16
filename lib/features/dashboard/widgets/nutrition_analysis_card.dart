import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/nutrition/providers/nutrition_notifier.dart';
import '../../../../core/widgets/app_card.dart';

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
        icon: Icons.restaurant,
        title: "Analyse nutritionnelle",
        child: const Text(
          "Aucune analyse disponible pour le moment.",
        ),
      );
    }

    return AppCard(
      icon: Icons.restaurant,
      title: "Analyse nutritionnelle",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "Score nutritionnel : ${analysis.nutritionScore.toStringAsFixed(1)} %",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Index glycémique moyen : ${analysis.averageGlycemicIndex.toStringAsFixed(1)}",
          ),

          Text(
            "Score fibres : ${analysis.fiberScore.toStringAsFixed(1)} %",
          ),

          Text(
            "Score protéines : ${analysis.proteinScore.toStringAsFixed(1)} %",
          ),

          Text(
            "Score anti-inflammatoire : ${analysis.antiInflammatoryScore.toStringAsFixed(1)} %",
          ),

          const SizedBox(height: 20),

          const Text(
            "✅ Recommandés",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          ...analysis.recommendedFoods.map(
            (food) => Text("• $food"),
          ),

          const SizedBox(height: 15),

          const Text(
            "⚠ À limiter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          ...analysis.foodsToLimit.map(
            (food) => Text("• $food"),
          ),

          const SizedBox(height: 15),

          const Text(
            "❌ À éviter",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          ...analysis.foodsToAvoid.map(
            (food) => Text("• $food"),
          ),
        ],
      ),
    );
  }
}