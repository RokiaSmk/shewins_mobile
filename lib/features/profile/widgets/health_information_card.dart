import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_dropdown_field.dart';
import '../../../core/widgets/app_text_field.dart';
import '../models/blood_group.dart';

class HealthInformationCard extends StatelessWidget {
  final TextEditingController heightController;
  final TextEditingController weightController;

  final BloodGroup? selectedBloodGroup;
  final ValueChanged<BloodGroup?> onBloodGroupChanged;

  const HealthInformationCard({
    super.key,
    required this.heightController,
    required this.weightController,
    required this.selectedBloodGroup,
    required this.onBloodGroupChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Informations de santé",
      icon: Icons.favorite_outline,
      child: Column(
        children: [

          AppTextField(
            controller: heightController,
            label: "Taille (cm)",
            hint: "170",
            keyboardType: TextInputType.number,
            prefixIcon: Icons.height,
          ),

          const SizedBox(height: 20),

          AppTextField(
            controller: weightController,
            label: "Poids (kg)",
            hint: "65",
            keyboardType: TextInputType.number,
            prefixIcon: Icons.monitor_weight_outlined,
          ),

          const SizedBox(height: 20),

          AppDropdownField<BloodGroup>(
            label: "Groupe sanguin",
            prefixIcon: Icons.bloodtype_outlined,
            value: selectedBloodGroup,

            items: BloodGroup.values.map((group) {

              return DropdownMenuItem(
                value: group,
                child: Text(group.label),
              );

            }).toList(),

            onChanged: onBloodGroupChanged,
          ),
        ],
      ),
    );
  }
}