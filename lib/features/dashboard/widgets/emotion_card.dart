import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../tracking/emotion/providers/emotion_notifier.dart';

class EmotionCard extends ConsumerWidget {
  const EmotionCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emotions = ref.watch(emotionProvider).emotions;

    if (emotions.isEmpty) {
      return AppCard(
        title: "Humeur",
        icon: Icons.emoji_emotions_outlined,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.sentiment_neutral_rounded,
                color: Colors.amber,
                size: 32,
              ),
              SizedBox(height: 12),
              Text(
                "Aucune humeur enregistrée",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Enregistrez votre humeur chaque jour afin que SheWins puisse mieux analyser votre bien-être émotionnel.",
                style: TextStyle(
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final emotion = emotions.first;
    final formatter = DateFormat("d MMM yyyy", "fr");

    return AppCard(
      title: "Dernière humeur",
      icon: Icons.emoji_emotions_outlined,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  child: Text(
                    emotion.mood.label.split(" ").first,
                    style: const TextStyle(fontSize: 22),
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        emotion.mood.label,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Enregistrée le ${formatter.format(emotion.emotionDate)}",
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
                child: _EmotionInfoCard(
                  icon: Icons.calendar_today_rounded,
                  title: "Date",
                  value: formatter.format(
                    emotion.emotionDate,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _EmotionInfoCard(
                  icon: Icons.mood_rounded,
                  title: "État",
                  value: emotion.mood.label,
                ),
              ),
            ],
          ),

          if (emotion.note != null &&
              emotion.note!.trim().isNotEmpty) ...[
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
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.notes_rounded,
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      emotion.note!,
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

class _EmotionInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _EmotionInfoCard({
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