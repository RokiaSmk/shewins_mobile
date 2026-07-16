import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text_field.dart';

import '../providers/cycle_notifier.dart';
import '../requests/start_cycle_request.dart';

class StartCyclePage extends ConsumerStatefulWidget {
  const StartCyclePage({super.key});

  @override
  ConsumerState<StartCyclePage> createState() =>
      _StartCyclePageState();
}

class _StartCyclePageState
    extends ConsumerState<StartCyclePage> {

  final TextEditingController startDateController =
      TextEditingController();

  DateTime? startDate;

  @override
  void dispose() {
    startDateController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    if (picked == null) return;

    startDate = picked;

    startDateController.text =
        "${picked.day}/${picked.month}/${picked.year}";
  }

  @override
  Widget build(BuildContext context) {

    final loading =
        ref.watch(cycleProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Démarrer un cycle",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AppCard(
          title: "Nouveau cycle",
          icon: Icons.calendar_month,
          child: Column(
            children: [

              AppTextField(
                controller: startDateController,
                label: "Date de début",
                readOnly: true,
                prefixIcon: Icons.calendar_today,
                onTap: pickDate,
              ),

              const SizedBox(height: 30),

              AppButton(
                text: "Démarrer",
                isLoading: loading,
                onPressed: () async {

                  if (startDate == null) {
                    return;
                  }

                  final success = await ref
                      .read(cycleProvider.notifier)
                      .startCycle(
                        StartCycleRequest(
                          startDate: startDate!,
                        ),
                      );

                  if (!mounted) return;

                  if (success) {
                    context.pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}