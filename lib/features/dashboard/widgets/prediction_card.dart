import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/app_card.dart';
import '../../analytics/prediction/providers/prediction_notifier.dart';

class PredictionCard extends ConsumerWidget {
  const PredictionCard({super.key});

  String _confidenceLabel(int score) {
    if (score >= 85) return "Très fiable";
    if (score >= 60) return "Fiabilité moyenne";
    return "Faible fiabilité";
  }

  Color _confidenceColor(int score) {
    if (score >= 85) {
      return const Color(0xFF4CAF50);
    }

    if (score >= 60) {
      return const Color(0xFFFF9800);
    }

    return const Color(0xFFE91E63);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(predictionProvider);
    final prediction = state.prediction;

    if (prediction == null) {
      return AppCard(
        title: "Prévisions du cycle",
        icon: Icons.auto_graph_rounded,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SheWins a besoin d'au moins trois cycles enregistrés pour générer des prévisions fiables.",
              style: TextStyle(height: 1.5),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.psychology_alt_rounded),
                label: const Text("Générer mes prévisions"),
                onPressed: () async {
                  final notifier =
                      ref.read(predictionProvider.notifier);

                  await notifier.generatePrediction();

                  if (!context.mounted) return;

                  final newState =
                      ref.read(predictionProvider);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        newState.error == null
                            ? "✅ Prévisions générées."
                            : "⚠️ ${newState.error}",
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

    final formatter = DateFormat("d MMM", "fr");

    return AppCard(
      title: "Prévisions personnalisées",
      icon: Icons.auto_graph_rounded,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Vos prochaines prévisions",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 4),

          Text(
            "Basées sur votre historique de cycles.",
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 22),

          _ConfidenceCard(
            score: prediction.confidenceScore,
            label: _confidenceLabel(
              prediction.confidenceScore,
            ),
            color: _confidenceColor(
              prediction.confidenceScore,
            ),
          ),

          const SizedBox(height: 22),

          _PredictionTile(
            icon: Icons.water_drop_rounded,
            color: const Color(0xFFE91E63),
            title: "Prochaines règles",
            value:
                "${formatter.format(prediction.predictedPeriodStart)}  →  ${formatter.format(prediction.predictedPeriodEnd)}",
          ),

          const SizedBox(height: 12),

          _PredictionTile(
            icon: Icons.favorite_rounded,
            color: const Color(0xFF9C27B0),
            title: "Ovulation",
            value: formatter.format(
              prediction.predictedOvulationDate,
            ),
          ),

          const SizedBox(height: 12),

          _PredictionTile(
            icon: Icons.spa_rounded,
            color: Colors.green,
            title: "Fenêtre fertile",
            value:
                "${formatter.format(prediction.fertileWindowStart)}  →  ${formatter.format(prediction.fertileWindowEnd)}",
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: _StatisticCard(
                  icon: Icons.timeline_rounded,
                  title: "Cycle moyen",
                  value:
                      "${prediction.averageCycleLength.toStringAsFixed(1)} j",
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _StatisticCard(
                  icon: Icons.analytics_outlined,
                  title: "Variabilité",
                  value:
                      "${prediction.cycleVariability.toStringAsFixed(1)} j",
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          const _InsightCard(),
        ],
      ),
    );
  }
}
class _PredictionTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String value;

  const _PredictionTile({
    required this.icon,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
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
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

class _ConfidenceCard extends StatelessWidget {
  final int score;
  final String label;
  final Color color;

  const _ConfidenceCard({
    required this.score,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.verified_rounded,
                color: color,
              ),

              const SizedBox(width: 8),

              const Text(
                "Indice de confiance",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          ClipRRect(
            borderRadius:
                BorderRadius.circular(30),
            child: LinearProgressIndicator(
              value: score / 100,
              minHeight: 10,
              color: color,
              backgroundColor:
                  color.withOpacity(.15),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$score %",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color:
                      color.withOpacity(.15),
                  borderRadius:
                      BorderRadius.circular(30),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatisticCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _StatisticCard({
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
        borderRadius:
            BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor:
                Theme.of(context)
                    .primaryColor
                    .withOpacity(.1),
            child: Icon(
              icon,
              color:
                  Theme.of(context)
                      .primaryColor,
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
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: const Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.psychology_alt_rounded,
              color: Colors.pink,
            ),
          ),

          SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  "Analyse SheWins",
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Votre cycle semble relativement stable. Continuez à enregistrer vos symptômes, votre humeur et vos repas afin d'améliorer la précision des prochaines prévisions.",
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