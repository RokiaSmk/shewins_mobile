import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_date_field.dart';

class PersonalInformationCard extends StatelessWidget {
  final DateTime? dateOfBirth;
  final ValueChanged<DateTime> onDateSelected;

  const PersonalInformationCard({
    super.key,
    required this.dateOfBirth,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Informations personnelles",
      icon: Icons.person_outline,
      child: Column(
        children: [
          AppDateField(
            value: dateOfBirth,
            onSelected: onDateSelected,
          ),
        ],
      ),
    );
  }
}