import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/widgets/app_card.dart';
import '../models/medical_report.dart';

class ReportCard extends StatelessWidget {
  final MedicalReport report;

  const ReportCard({
    super.key,
    required this.report,
  });

  Future<void> _openReport() async {
    final uri = Uri.parse(report.reportUrl);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter =
        DateFormat("dd/MM/yyyy HH:mm");

    return AppCard(
      icon: Icons.description_outlined,
      title: "Rapport médical",
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.picture_as_pdf,
                color: Colors.red,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  report.summary,
                  style: const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            "📅 Généré le ${formatter.format(report.generatedAt)}",
          ),

          const SizedBox(height: 6),

          Text(
            "🗂 Période : ${report.period}",
          ),

          const SizedBox(height: 6),

          Text(
            "📄 Format : ${report.format}",
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _openReport,
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
                  onPressed: _openReport,
                  icon: const Icon(
                    Icons.download,
                  ),
                  label: const Text(
                    "Télécharger",
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