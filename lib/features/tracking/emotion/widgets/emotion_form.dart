import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text_field.dart';

import '../models/emotion_journal.dart';
import '../models/enums/mood_type.dart';

import '../providers/emotion_notifier.dart';

import '../requests/create_emotion_request.dart';
import '../requests/update_emotion_request.dart';

class EmotionForm extends ConsumerStatefulWidget {
  final String cycleId;
  final EmotionJournal? emotion;

  const EmotionForm({
    super.key,
    required this.cycleId,
    this.emotion,
  });

  @override
  ConsumerState<EmotionForm> createState() =>
      _EmotionFormState();
}

class _EmotionFormState
    extends ConsumerState<EmotionForm> {

  final noteController = TextEditingController();

  late MoodType selectedMood;

  late DateTime emotionDate;

  @override
  void initState() {
    super.initState();

    selectedMood =
        widget.emotion?.mood ??
        MoodType.happy;

    emotionDate =
        widget.emotion?.emotionDate ??
        DateTime.now();

    noteController.text =
        widget.emotion?.note ?? "";
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final loading =
        ref.watch(emotionProvider).isLoading;

    return ListView(
      children: [

        AppCard(
          title: "Journal émotionnel",
          icon: Icons.emoji_emotions,
          child: Column(
            children: [

              DropdownButtonFormField<MoodType>(
                value: selectedMood,
                decoration: const InputDecoration(
                  labelText: "Émotion",
                ),
                items: MoodType.values.map((mood) {
                  return DropdownMenuItem(
                    value: mood,
                    child: Text(
                      mood.label,
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    selectedMood = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "${emotionDate.day}/${emotionDate.month}/${emotionDate.year}",
                ),
                trailing: const Icon(
                  Icons.calendar_today,
                ),
                onTap: () async {

                  final picked =
                      await showDatePicker(
                    context: context,
                    initialDate: emotionDate,
                    firstDate:
                        DateTime(2020),
                    lastDate:
                        DateTime.now(),
                  );

                  if (picked != null) {
                    setState(() {
                      emotionDate = picked;
                    });
                  }
                },
              ),

              const SizedBox(height: 20),

              AppTextField(
                controller: noteController,
                label: "Note",
                maxLines: 4,
              ),

              const SizedBox(height: 30),

              AppButton(
                text: widget.emotion == null
                    ? "Enregistrer"
                    : "Mettre à jour",
                isLoading: loading,
                onPressed: () async {

                  bool success;

                  if (widget.emotion == null) {

                    success = await ref
                        .read(
                          emotionProvider.notifier,
                        )
                        .createEmotion(
                          CreateEmotionRequest(
                            cycleId: widget.cycleId,
                            mood: selectedMood,
                            note: noteController.text,
                            emotionDate:
                                emotionDate,
                          ),
                        );

                  } else {

                    success = await ref
                        .read(
                          emotionProvider.notifier,
                        )
                        .updateEmotion(
                          widget.emotion!.id,
                          UpdateEmotionRequest(
                            mood: selectedMood,
                            note: noteController.text,
                            emotionDate:
                                emotionDate,
                          ),
                        );

                  }

                  if (!mounted) return;

                  if (success) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}