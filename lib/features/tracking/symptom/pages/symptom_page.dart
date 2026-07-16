import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../providers/symptom_notifier.dart';
import '../widgets/symptom_tile.dart';

class SymptomPage extends ConsumerStatefulWidget {
  const SymptomPage({super.key});

  @override
  ConsumerState<SymptomPage> createState() =>
      _SymptomPageState();
}

class _SymptomPageState
    extends ConsumerState<SymptomPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(symptomProvider.notifier)
          .loadMemberSymptoms();
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(symptomProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes symptômes"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(
            AppRoutes.createSymptom,
          );
        },
        child: const Icon(Icons.add),
      ),

      body: state.symptoms.isEmpty
          ? const Center(
              child: Text(
                "Aucun symptôme enregistré.",
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.symptoms.length,
              itemBuilder: (_, index) {

                return SymptomTile(
                  symptom: state.symptoms[index],
                );
              },
            ),
    );
  }
}