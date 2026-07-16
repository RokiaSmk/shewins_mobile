import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_card.dart';
import '../models/symptom.dart';
import '../providers/symptom_notifier.dart';
import 'edit_symptom_bottom_sheet.dart';

class SymptomTile extends ConsumerWidget {
  final Symptom symptom;

  const SymptomTile({
    super.key,
    required this.symptom,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AppCard(
        title: symptom.symptomType.label,
        icon: Icons.favorite_outline,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton<String>(
                onSelected: (value) async {
                  switch (value) {
                    case "delete":
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text(
                            "Supprimer le symptôme",
                          ),
                          content: const Text(
                            "Voulez-vous vraiment supprimer ce symptôme ?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, false),
                              child: const Text("Annuler"),
                            ),
                            FilledButton(
                              onPressed: () =>
                                  Navigator.pop(context, true),
                              child: const Text("Supprimer"),
                            ),
                          ],
                        ),
                      );

                      if (confirm == true) {
                        await ref
                            .read(symptomProvider.notifier)
                            .deleteSymptom(symptom.id);
                      }
                      break;

                    case "edit":
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => EditSymptomBottomSheet(
                        symptom: symptom,
                      ),
                    );
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
              "Intensité : ${symptom.intensity.apiValue}",
            ),

            const SizedBox(height: 8),

            if (symptom.note != null &&
                symptom.note!.isNotEmpty)
              Text(symptom.note!),
          ],
        ),
      ),
    );
  }
}