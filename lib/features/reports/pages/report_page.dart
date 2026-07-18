import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/report_notifier.dart';
import '../widgets/report_card.dart';

class ReportPage extends ConsumerStatefulWidget {
  const ReportPage({
    super.key,
  });

  @override
  ConsumerState<ReportPage> createState() =>
      _ReportPageState();
}

class _ReportPageState
    extends ConsumerState<ReportPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(reportProvider.notifier)
          .loadReports();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(reportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rapports médicaux",
        ),
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () async {
          final notifier =
              ref.read(reportProvider.notifier);

          await notifier.generateReport();

          if (!context.mounted) return;

          final state =
              ref.read(reportProvider);

          ScaffoldMessenger.of(context)
              .showSnackBar(
            SnackBar(
              content: Text(
                state.error == null
                    ? "✅ Rapport généré avec succès."
                    : "⚠️ ${state.error}",
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.picture_as_pdf,
        ),
        label: const Text(
          "Générer",
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          await ref
              .read(reportProvider.notifier)
              .loadReports();
        },
        child: Builder(
          builder: (_) {
            if (state.isLoading &&
                state.reports.isEmpty) {
              return const Center(
                child:
                    CircularProgressIndicator(),
              );
            }

            if (state.reports.isEmpty) {
              return ListView(
                padding:
                    const EdgeInsets.all(24),
                children: const [
                  SizedBox(height: 120),

                  Icon(
                    Icons.description_outlined,
                    size: 80,
                    color: Colors.grey,
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: Text(
                      "Aucun rapport médical disponible.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              );
            }

            return ListView.separated(
              padding:
                  const EdgeInsets.all(20),
              itemCount:
                  state.reports.length,
              separatorBuilder:
                  (_, __) =>
                      const SizedBox(
                height: 16,
              ),
              itemBuilder: (_, index) {
                return ReportCard(
                  report:
                      state.reports[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}