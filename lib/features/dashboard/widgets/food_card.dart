import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../tracking/food/providers/food_notifier.dart';

class FoodCard extends ConsumerWidget {
  const FoodCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journals = ref.watch(foodProvider).journals;

    if (journals.isEmpty) {
      return AppCard(
        title: "Journal alimentaire",
        icon: Icons.restaurant_menu_rounded,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.restaurant_menu_rounded,
                color: Colors.green,
                size: 32,
              ),
              SizedBox(height: 12),
              Text(
                "Aucun repas enregistré",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Ajoutez vos repas afin que SheWins puisse analyser vos habitudes alimentaires et vous proposer des recommandations personnalisées.",
                style: TextStyle(height: 1.5),
              ),
            ],
          ),
        ),
      );
    }

    final meal = journals.first;
    final formatter = DateFormat("d MMM yyyy", "fr");

    return AppCard(
      title: "Dernier repas",
      icon: Icons.restaurant_menu_rounded,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.restaurant,
                    color: Colors.green.shade700,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.mealType.label,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Enregistré le ${formatter.format(meal.mealDate)}",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: _FoodInfoCard(
                  icon: Icons.calendar_today_rounded,
                  title: "Date",
                  value: formatter.format(
                    meal.mealDate,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _FoodInfoCard(
                  icon: Icons.fastfood_rounded,
                  title: "Aliments",
                  value:
                      "${meal.foodIds.length}",
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius:
                  BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color: Colors.green,
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    meal.foodIds.length >= 5
                        ? "Votre repas est varié. Continuez à maintenir une alimentation équilibrée."
                        : "Essayez d'ajouter davantage d'aliments variés pour enrichir votre alimentation.",
                    style: const TextStyle(
                      height: 1.5,
                    ),
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

class _FoodInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _FoodInfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                Theme.of(context)
                    .primaryColor
                    .withOpacity(.1),
            child: Icon(
              icon,
              color:
                  Theme.of(context)
                      .primaryColor,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
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
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}