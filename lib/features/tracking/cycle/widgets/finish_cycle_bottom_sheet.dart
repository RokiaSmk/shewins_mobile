import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';

import '../models/enums/flow_intensity.dart';
import '../providers/cycle_notifier.dart';
import '../requests/finish_cycle_request.dart';

class FinishCycleBottomSheet extends ConsumerStatefulWidget {
  final String cycleId;

  const FinishCycleBottomSheet({
    super.key,
    required this.cycleId,
  });

  @override
  ConsumerState<FinishCycleBottomSheet> createState() =>
      _FinishCycleBottomSheetState();
}

class _FinishCycleBottomSheetState
    extends ConsumerState<FinishCycleBottomSheet> {
  final TextEditingController endDateController =
      TextEditingController();

  DateTime? endDate;

  FlowIntensity flowIntensity =
      FlowIntensity.medium;

  @override
  void dispose() {
    endDateController.dispose();
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

    endDate = picked;

    endDateController.text =
        "${picked.day}/${picked.month}/${picked.year}";
  }

  @override
  Widget build(BuildContext context) {
    final loading =
        ref.watch(cycleProvider).isLoading;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Terminer le cycle",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            AppTextField(
              controller: endDateController,
              label: "Date de fin",
              readOnly: true,
              prefixIcon: Icons.calendar_today,
              onTap: pickDate,
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<FlowIntensity>(
              value: flowIntensity,
              decoration: const InputDecoration(
                labelText: "Intensité du flux",
              ),
              items: FlowIntensity.values.map((flow) {
                return DropdownMenuItem(
                  value: flow,
                  child: Text(flow.apiValue),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  flowIntensity = value;
                });
              },
            ),

            const SizedBox(height: 30),

            AppButton(
              text: "Terminer",
              isLoading: loading,
              onPressed: () async {
                if (endDate == null) return;

                final success = await ref
                    .read(cycleProvider.notifier)
                    .finishCycle(
                      widget.cycleId,
                      FinishCycleRequest(
                        endDate: endDate!,
                        flowIntensity: flowIntensity,
                      ),
                    );

                if (!mounted) return;

                if (success) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}