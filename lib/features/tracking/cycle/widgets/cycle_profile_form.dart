import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../providers/cycle_notifier.dart';
import '../requests/create_cycle_profile_request.dart';
import 'package:go_router/go_router.dart';

class CycleProfileForm extends ConsumerStatefulWidget {
  const CycleProfileForm({super.key});

  @override
  ConsumerState<CycleProfileForm> createState() =>
      _CycleProfileFormState();
}

class _CycleProfileFormState
    extends ConsumerState<CycleProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final averageCycleController =
      TextEditingController();

  final averagePeriodController =
      TextEditingController();

  bool regularCycle = true;

  @override
  void dispose() {
    averageCycleController.dispose();
    averagePeriodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(cycleProvider).isLoading;
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          AppCard(
            title: "Profil menstruel",
            icon: Icons.favorite,
            child: Column(
              children: [
                AppTextField(
                  controller: averageCycleController,
                  label: "Durée moyenne du cycle",
                  hint: "28",
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: averagePeriodController,
                  label: "Durée moyenne des règles",
                  hint: "5",
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 20),

                SwitchListTile(
                  value: regularCycle,
                  title: const Text(
                    "Cycle régulier",
                  ),
                  onChanged: (value) {
                    setState(() {
                      regularCycle = value;
                    });
                  },
                ),

                const SizedBox(height: 24),

                AppButton(
                  text: "Enregistrer",
                  isLoading: loading,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    final success = await ref
                        .read(cycleProvider.notifier)
                        .createProfile(
                          CreateCycleProfileRequest(
                            averageCycleLength: int.parse(
                              averageCycleController.text,
                            ),
                            averagePeriodLength: int.parse(
                              averagePeriodController.text,
                            ),
                            regularCycle: regularCycle,
                          ),
                        );

                    if (!mounted) return;

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Profil menstruel enregistré avec succès.",
                          ),
                        ),
                      );

                      context.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}