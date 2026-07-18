import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_card.dart';
import '../../analytics/statistics/providers/statistics_notifier.dart';

class StatisticsCard extends ConsumerWidget {
  const StatisticsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(statisticsProvider);
    final statistics = state.statistics;

    if (statistics == null) {
      return AppCard(
        title: "Statistiques",
        icon: Icons.bar_chart_rounded,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "Générez vos statistiques afin de visualiser l'évolution de votre santé au fil des cycles.",
              style: TextStyle(height: 1.5),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(
                  Icons.analytics_rounded,
                ),
                label: const Text(
                  "Générer les statistiques",
                ),
                onPressed: () async {
                  final notifier = ref.read(
                    statisticsProvider.notifier,
                  );

                  await notifier.generateStatistics();

                  if (!context.mounted) return;

                  final state = ref.read(
                    statisticsProvider,
                  );

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error == null
                            ? "✅ Statistiques générées."
                            : "⚠️ ${state.error}",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return AppCard(
      title: "Vos statistiques",
      icon: Icons.bar_chart_rounded,
      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: _StatisticValueCard(
                  icon: Icons.calendar_month_rounded,
                  color: Colors.pink,
                  title: "Cycles",
                  value:
                      "${statistics.totalCycles}",
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _StatisticValueCard(
                  icon: Icons.show_chart_rounded,
                  color: Colors.indigo,
                  title: "Cycle moyen",
                  value:
                      "${statistics.averageCycleLength.toStringAsFixed(1)} j",
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          _StatisticTile(
            icon: Icons.favorite_rounded,
            color: Colors.red,
            title: "Symptôme dominant",
            value:
                statistics.mostFrequentSymptom,
          ),

          const SizedBox(height: 12),

          _StatisticTile(
            icon: Icons.mood_rounded,
            color: Colors.amber,
            title: "Humeur dominante",
            value:
                statistics.dominantMood,
          ),

          const SizedBox(height: 12),

          _StatisticTile(
            icon: Icons.restaurant_rounded,
            color: Colors.green,
            title: "Repas dominant",
            value:
                statistics.dominantMealType,
          ),

          const SizedBox(height: 22),

          const _StatisticsFooter(),
        ],
      ),
    );
  }
}
class _StatisticValueCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const _StatisticValueCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(height: 14),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatisticTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const _StatisticTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: const TextStyle(
                    height: 1.5,
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

class _StatisticsFooter extends StatelessWidget {
  const _StatisticsFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.insights_rounded,
              color: Colors.indigo.shade400,
            ),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  "Résumé statistique",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Ces statistiques sont calculées à partir de vos cycles, symptômes, émotions et habitudes alimentaires afin de suivre votre évolution au fil du temps.",
                  style: TextStyle(
                    height: 1.5,
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