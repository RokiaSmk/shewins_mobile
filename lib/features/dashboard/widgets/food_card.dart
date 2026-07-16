import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../tracking/food/providers/food_notifier.dart';

class FoodCard extends ConsumerWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journals =
        ref.watch(foodProvider).journals;

    if (journals.isEmpty) {
      return AppCard(
        icon: Icons.restaurant_menu,
        title: "Journal alimentaire",
        child: const Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              "Aucun repas enregistré.",
            ),
            SizedBox(height: 10),
            Text(
              "Ajoutez vos repas pour analyser votre alimentation.",
            ),
          ],
        ),
      );
    }

    final last = journals.first;

    return AppCard(
      icon: Icons.restaurant_menu,
      title: "Dernier repas",
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            last.mealType.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "${last.mealDate.day}/${last.mealDate.month}/${last.mealDate.year}",
          ),

          const SizedBox(height: 8),

          Text(
            "${last.foodIds.length} aliment(s)",
          ),
        ],
      ),
    );
  }
}