import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/app_card.dart';

import '../../tracking/cycle/providers/cycle_notifier.dart';
import '../../tracking/emotion/providers/emotion_notifier.dart';
import '../../tracking/food/providers/food_notifier.dart';
import '../../tracking/symptom/providers/symptom_notifier.dart';

class HealthOverviewCard extends ConsumerWidget {
  const HealthOverviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleState = ref.watch(cycleProvider);
    final emotionState = ref.watch(emotionProvider);
    final symptomState = ref.watch(symptomProvider);
    final foodState = ref.watch(foodProvider);

    final cycle = cycleState.profile == null
        ? "-"
        : cycleState.profile!.regularCycle
            ? "Régulier"
            : "Irrégulier";

    final mood = emotionState.emotions.isEmpty
        ? "Aucune"
        : emotionState.emotions.first.mood.label;

    final meals = foodState.journals.length.toString();

    final symptoms = symptomState.symptoms.length.toString();

    return AppCard(
      title: "Résumé de votre santé",
      icon: Icons.favorite_rounded,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _HealthTile(
                  icon: Icons.favorite_outline,
                  title: "Humeur",
                  value: mood,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _HealthTile(
                  icon: Icons.calendar_month,
                  title: "Cycle",
                  value: cycle,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: _HealthTile(
                  icon: Icons.restaurant,
                  title: "Repas",
                  value: meals,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _HealthTile(
                  icon: Icons.monitor_heart_outlined,
                  title: "Symptômes",
                  value: symptoms,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.tips_and_updates_rounded,
                  color: Colors.pink,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Continuez votre suivi quotidien pour obtenir des analyses et des prédictions toujours plus précises.",
                    style: TextStyle(
                      height: 1.4,
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

class _HealthTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _HealthTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                Theme.of(context).primaryColor.withOpacity(.1),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}