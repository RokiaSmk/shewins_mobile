import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/enums/report_reason.dart';
import '../providers/report_notifier.dart';
import '../requests/create_report_request.dart';

class ReportPublicationPage
    extends ConsumerStatefulWidget {
  final String publicationId;

  const ReportPublicationPage({
    super.key,
    required this.publicationId,
  });

  @override
  ConsumerState<ReportPublicationPage>
      createState() =>
          _ReportPublicationPageState();
}

class _ReportPublicationPageState
    extends ConsumerState<ReportPublicationPage> {
  ReportReason _reason = ReportReason.spam;

  final TextEditingController
      _descriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signaler la publication",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<
                ReportReason>(
              value: _reason,
              decoration:
                  const InputDecoration(
                labelText: "Motif",
              ),
              items: ReportReason.values
                  .map(
                    (reason) =>
                        DropdownMenuItem(
                      value: reason,
                      child: Text(
                        reason.value,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _reason = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            TextField(
              controller:
                  _descriptionController,
              maxLines: 5,
              decoration:
                  const InputDecoration(
                labelText:
                    "Description (optionnelle)",
              ),
            ),

            const SizedBox(height: 30),

            FilledButton(
              onPressed: state.isLoading
                  ? null
                  : () async {
                      await ref
                          .read(
                            reportProvider
                                .notifier,
                          )
                          .reportPublication(
                            widget
                                .publicationId,
                            CreateReportRequest(
                              reason:
                                  _reason,
                              description:
                                  _descriptionController
                                      .text,
                            ),
                          );

                      if (mounted) {
                        Navigator.pop(
                          context,
                        );
                      }
                    },
              child: state.isLoading
                  ? const CircularProgressIndicator()
                  : const Text(
                      "Envoyer le signalement",
                    ),
            ),
          ],
        ),
      ),
    );
  }
}