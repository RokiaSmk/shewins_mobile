import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../cycle/providers/cycle_notifier.dart';
import '../widgets/food_form.dart';

class CreateFoodPage extends ConsumerWidget {
  const CreateFoodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentCycle =
        ref.watch(cycleProvider.notifier)
            .currentCycle;

    if (currentCycle == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Nouveau repas",
          ),
        ),
        body: const Center(
          child: Text(
            "Aucun cycle en cours.",
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nouveau repas",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FoodForm(
            cycleId: currentCycle.id,
          ),
        ),
      ),
    );
  }
}