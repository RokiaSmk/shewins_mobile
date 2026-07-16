import 'package:flutter/material.dart';

import '../models/emotion_journal.dart';
import 'emotion_form.dart';

class EditEmotionBottomSheet extends StatelessWidget {
  final EmotionJournal emotion;

  const EditEmotionBottomSheet({
    super.key,
    required this.emotion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom:
            MediaQuery.of(context).viewInsets.bottom +
                20,
      ),
      child: EmotionForm(
        cycleId: emotion.cycleId,
        emotion: emotion,
      ),
    );
  }
}