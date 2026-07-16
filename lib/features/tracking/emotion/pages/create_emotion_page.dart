import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cycle/providers/cycle_notifier.dart';
import '../widgets/emotion_form.dart';

class CreateEmotionPage extends ConsumerWidget {
  const CreateEmotionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCycle =
        ref.watch(cycleProvider.notifier).currentCycle;

    if (currentCycle == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Nouvelle émotion"),
        ),
        body: const Center(
          child: Text(
            "Aucun cycle en cours.\nVeuillez démarrer un cycle avant d'ajouter une émotion.",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvelle émotion"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: EmotionForm(
            cycleId: currentCycle.id,
          ),
        ),
      ),
    );
  }
}