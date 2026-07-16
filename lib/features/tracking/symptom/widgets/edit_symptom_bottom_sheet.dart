import 'package:flutter/material.dart';

import '../models/symptom.dart';
import 'symptom_form.dart';

class EditSymptomBottomSheet extends StatelessWidget {
  final Symptom symptom;

  const EditSymptomBottomSheet({
    super.key,
    required this.symptom,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom:
            MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SymptomForm(
        cycleId: symptom.cycleId,
        symptom: symptom,
      ),
    );
  }
}