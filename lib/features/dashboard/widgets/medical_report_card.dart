import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/widgets/app_card.dart';

import '../../reports/providers/report_notifier.dart';

class MedicalReportCard
    extends ConsumerWidget {
  const MedicalReportCard({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final state = ref.watch(reportProvider);

    if (state.reports.isEmpty) {
      return AppCard(
        icon: Icons.description_outlined,
        title: "Rapport médical",
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              "Vous n'avez encore généré aucun rapport médical.",
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () async {
                  await ref
                      .read(reportProvider.notifier)
                      .generateReport();
                },
                icon: const Icon(
                  Icons.picture_as_pdf,
                ),
                label: const Text(
                  "Générer un rapport",
                ),
              ),
            ),
          ],
        ),
      );
    }

    final report = state.reports.first;

    return AppCard(
      icon: Icons.description_outlined,
      title: "Dernier rapport médical",
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            report.summary,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "📅 ${DateFormat("dd/MM/yyyy").format(report.generatedAt)}",
          ),

          const SizedBox(height: 6),

          Text(
            "📄 ${report.format}",
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    context.push(
                      AppRoutes.reports,
                    );
                  },
                  icon: const Icon(
                    Icons.visibility,
                  ),
                  label: const Text(
                    "Voir",
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: FilledButton.icon(
                  onPressed: () {
                    context.push(
                      AppRoutes.reports,
                    );
                  },
                  icon: const Icon(
                    Icons.list_alt,
                  ),
                  label: const Text(
                    "Tous",
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