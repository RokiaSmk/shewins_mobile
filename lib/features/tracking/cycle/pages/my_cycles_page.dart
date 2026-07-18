import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/app_card.dart';
import '../providers/cycle_notifier.dart';
import '../widgets/finish_cycle_bottom_sheet.dart';

class MyCyclesPage extends ConsumerStatefulWidget {
  const MyCyclesPage({super.key});

  @override
  ConsumerState<MyCyclesPage> createState() => _MyCyclesPageState();
}

class _MyCyclesPageState extends ConsumerState<MyCyclesPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(cycleProvider.notifier).loadCycles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cycleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes cycles"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutes.startCycle);
        },
        child: const Icon(Icons.add),
      ),
      body: state.cycles.isEmpty
          ? const Center(
              child: Text("Aucun cycle enregistré."),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.cycles.length,
              itemBuilder: (context, index) {
                final cycle = state.cycles[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      context.push(
                        AppRoutes.cycleDetails,
                        extra: cycle,
                      );
                    },
                    child: AppCard(
                      title: "Cycle ${index + 1}",
                      icon: Icons.calendar_month,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Début : ${cycle.startDate.day}/${cycle.startDate.month}/${cycle.startDate.year}",
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Statut : ${_status(cycle.status.apiValue)}",
                          ),

                          if (cycle.endDate != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Fin : ${cycle.endDate!.day}/${cycle.endDate!.month}/${cycle.endDate!.year}",
                              ),
                            ),

                          const SizedBox(height: 20),

                          if (cycle.status.apiValue == "ONGOING")
                            Align(
                              alignment: Alignment.centerRight,
                              child: FilledButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (_) => FinishCycleBottomSheet(
                                      cycleId: cycle.id,
                                    ),
                                  );
                                },
                                child: const Text("Terminer"),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  String _status(String status) {
    switch (status) {
      case "ONGOING":
        return "En cours";

      case "COMPLETED":
        return "Terminé";

      default:
        return status;
    }
  }
}