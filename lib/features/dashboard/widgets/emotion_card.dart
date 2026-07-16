import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../tracking/emotion/providers/emotion_notifier.dart';

class EmotionCard extends ConsumerWidget {
  const EmotionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emotions =
        ref.watch(emotionProvider).emotions;

    if (emotions.isEmpty) {
      return AppCard(
        icon: Icons.emoji_emotions_outlined,
        title: "Humeur",
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aucune humeur enregistrée.",
            ),
            SizedBox(height: 10),
            Text(
              "Comment vous sentez-vous aujourd'hui ?",
            ),
          ],
        ),
      );
    }

    final last = emotions.first;

    return AppCard(
      icon: Icons.emoji_emotions_outlined,
      title: "Dernière humeur",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            last.mood.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "${last.emotionDate.day}/${last.emotionDate.month}/${last.emotionDate.year}",
          ),

          if (last.note != null &&
              last.note!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(last.note!),
            ),
        ],
      ),
    );
  }
}