import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../tracking/cycle/providers/cycle_notifier.dart';

class CycleCard extends ConsumerWidget {
  const CycleCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cycleProvider);

    if (state.profile == null) {
      return AppCard(
        title: "Mon cycle",
        icon: Icons.calendar_month_rounded,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Vous n'avez pas encore configuré votre profil menstruel.",
            ),
            SizedBox(height: 12),
            Text(
              "Complétez votre profil pour commencer votre suivi.",
            ),
          ],
        ),
      );
    }

    return AppCard(
      title: "Mon cycle",
      icon: Icons.calendar_month_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Durée moyenne du cycle : ${state.profile!.averageCycleLength} jours",
          ),

          const SizedBox(height: 8),

          Text(
            "Durée moyenne des règles : ${state.profile!.averagePeriodLength} jours",
          ),

          const SizedBox(height: 8),

          Text(
            state.profile!.regularCycle
                ? "Cycle régulier"
                : "Cycle irrégulier",
          ),
        ],
      ),
    );
  }
}