import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../tracking/symptom/providers/symptom_notifier.dart';

class SymptomCard extends ConsumerWidget {
  const SymptomCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symptoms = ref.watch(symptomProvider).symptoms;

    if (symptoms.isEmpty) {
      return AppCard(
        title: "Symptômes",
        icon: Icons.monitor_heart_outlined,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.favorite_border_rounded,
                color: Colors.red,
                size: 32,
              ),
              SizedBox(height: 12),
              Text(
                "Aucun symptôme enregistré",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Ajoutez vos symptômes afin de mieux comprendre l'évolution de votre cycle et d'améliorer les analyses de SheWins.",
                style: TextStyle(height: 1.5),
              ),
            ],
          ),
        ),
      );
    }

    final symptom = symptoms.first;

    return AppCard(
      title: "Dernier symptôme",
      icon: Icons.monitor_heart_outlined,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red.shade400,
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        symptom.symptomType.label,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Symptôme enregistré récemment",
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
                child: _InfoCard(
                  icon: Icons.speed_rounded,
                  title: "Intensité",
                  value: symptom.intensity.apiValue,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _InfoCard(
                  icon: Icons.notes_rounded,
                  title: "Note",
                  value: (symptom.note == null || symptom.note!.isEmpty)
                      ? "-"
                      : "Disponible",
                ),
              ),
            ],
          ),

          if (symptom.note != null && symptom.note!.isNotEmpty) ...[
            const SizedBox(height: 18),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.notes_rounded),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      symptom.note!,
                      style: const TextStyle(
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard({
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