import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_card.dart';
import '../models/emotion_journal.dart';
import '../providers/emotion_notifier.dart';
import 'edit_emotion_bottom_sheet.dart';

class EmotionTile extends ConsumerWidget {
  final EmotionJournal emotion;

  const EmotionTile({
    super.key,
    required this.emotion,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AppCard(
        title: emotion.mood.label,
        icon: Icons.emoji_emotions_outlined,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton<String>(
                onSelected: (value) async {
                  switch (value) {
                    case "edit":
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) =>
                            EditEmotionBottomSheet(
                          emotion: emotion,
                        ),
                      );
                      break;

                    case "delete":
                      await ref
                          .read(emotionProvider.notifier)
                          .deleteEmotion(emotion.id);
                      break;
                  }
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: "edit",
                    child: Text("Modifier"),
                  ),
                  PopupMenuItem(
                    value: "delete",
                    child: Text("Supprimer"),
                  ),
                ],
              ),
            ),

            Text(
              emotion.note?.isNotEmpty == true
                  ? emotion.note!
                  : "Aucune note",
            ),

            const SizedBox(height: 10),

            Text(
              emotion.emotionDate
                  .toString()
                  .split(" ")
                  .first,
            ),
          ],
        ),
      ),
    );
  }
}