import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cycle/providers/cycle_notifier.dart';
import '../widgets/symptom_form.dart';

class CreateSymptomPage extends ConsumerWidget {
  const CreateSymptomPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCycle =
        ref.watch(cycleProvider.notifier).currentCycle;

    if (currentCycle == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Nouveau symptôme"),
        ),
        body: const Center(
          child: Text(
            "Aucun cycle en cours.\nVeuillez démarrer un cycle avant d'ajouter un symptôme.",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau symptôme"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SymptomForm(
            cycleId: currentCycle.id,
          ),
        ),
      ),
    );
  }
}