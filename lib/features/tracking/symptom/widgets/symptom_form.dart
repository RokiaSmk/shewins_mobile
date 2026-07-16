import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text_field.dart';

import '../models/enums/symptom_intensity.dart';
import '../models/enums/symptom_type.dart';

import '../providers/symptom_notifier.dart';
import '../requests/create_symptom_request.dart';
import '../models/symptom.dart';
import '../requests/update_symptom_request.dart';

class SymptomForm extends ConsumerStatefulWidget {
  final String cycleId;
  final Symptom? symptom;

  const SymptomForm({
  super.key,
  required this.cycleId,
  this.symptom,
});

  @override
  ConsumerState<SymptomForm> createState() =>
      _SymptomFormState();
}

class _SymptomFormState
    extends ConsumerState<SymptomForm> {

  final noteController = TextEditingController();

 late SymptomType selectedType;
  late SymptomIntensity intensity;

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    selectedType =
        widget.symptom?.symptomType ??
        SymptomType.cramps;

    intensity =
        widget.symptom?.intensity ??
        SymptomIntensity.mild;

    noteController.text =
        widget.symptom?.note ?? "";
  }

  @override
  Widget build(BuildContext context) {

    final loading =
        ref.watch(symptomProvider).isLoading;

    return ListView(
      children: [

        AppCard(
          title: "Nouveau symptôme",
          icon: Icons.favorite,
          child: Column(
            children: [

              DropdownButtonFormField<SymptomType>(
                value: selectedType,
                decoration: const InputDecoration(
                  labelText: "Symptôme",
                ),
                items: SymptomType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.label),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    selectedType = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<SymptomIntensity>(
                value: intensity,
                decoration: const InputDecoration(
                  labelText: "Intensité",
                ),
                items:
                    SymptomIntensity.values.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item.apiValue),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    intensity = value;
                  });
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
                text: "Enregistrer",
                isLoading: loading,
                onPressed: () async {
                  bool success;

                  if (widget.symptom == null) {
                    success = await ref
                        .read(symptomProvider.notifier)
                        .createSymptom(
                          CreateSymptomRequest(
                            cycleId: widget.cycleId,
                            symptomType: selectedType,
                            intensity: intensity,
                            note: noteController.text,
                          ),
                        );
                  } else {
                    success = await ref
                        .read(symptomProvider.notifier)
                        .updateSymptom(
                          widget.symptom!.id,
                          UpdateSymptomRequest(
                            symptomType: selectedType,
                            intensity: intensity,
                            note: noteController.text,
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