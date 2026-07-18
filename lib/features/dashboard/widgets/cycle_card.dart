import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/widgets/app_card.dart';
import '../../tracking/cycle/providers/cycle_notifier.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_routes.dart';

class CycleCard extends ConsumerWidget {
  const CycleCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cycleProvider);

    if (state.profile == null) {
      return AppCard(
        title: "Mon cycle",
        icon: Icons.calendar_month_rounded,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: Colors.pink,
                size: 32,
              ),

              const SizedBox(height: 12),

              const Text(
                "Votre profil menstruel n'est pas encore configuré.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Complétez votre profil afin que SheWins puisse suivre vos cycles et générer des analyses personnalisées.",
                style: TextStyle(height: 1.5),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () {
                    context.push(AppRoutes.cycleProfile);
                  },
                  icon: const Icon(Icons.edit_calendar),
                  label: const Text(
                    "Configurer mon profil menstruel",
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final profile = state.profile!;

    return AppCard(
      title: "Mon cycle",
      icon: Icons.calendar_month_rounded,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _CycleInfoCard(
                  icon: Icons.loop_rounded,
                  title: "Cycle moyen",
                  value: "${profile.averageCycleLength} j",
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _CycleInfoCard(
                  icon: Icons.water_drop_rounded,
                  title: "Règles",
                  value: "${profile.averagePeriodLength} j",
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: profile.regularCycle
                  ? Colors.green.shade50
                  : Colors.orange.shade50,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(
                    profile.regularCycle
                        ? Icons.check_circle_rounded
                        : Icons.warning_amber_rounded,
                    color: profile.regularCycle
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.regularCycle
                            ? "Cycle régulier"
                            : "Cycle irrégulier",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: profile.regularCycle
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        profile.regularCycle
                            ? "Votre cycle est relativement stable. Les prévisions seront plus fiables."
                            : "Votre cycle présente quelques variations. Continuez votre suivi pour améliorer les analyses.",
                        style: const TextStyle(
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CycleInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _CycleInfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                Theme.of(context).primaryColor.withOpacity(.1),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}