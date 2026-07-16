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
        icon: Icons.favorite_outline,
        title: "Symptômes",
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Aucun symptôme enregistré."),
            SizedBox(height: 10),
            Text("Enregistrez vos symptômes pour suivre leur évolution."),
          ],
        ),
      );
    }

    final last = symptoms.first;

    return AppCard(
      icon: Icons.favorite_outline,
      title: "Dernier symptôme",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            last.symptomType.label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text("Intensité : ${last.intensity.apiValue}"),
          if (last.note != null && last.note!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(last.note!),
            ),
        ],
      ),
    );
  }
}
