import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateField extends StatelessWidget {
  final DateTime? value;
  final ValueChanged<DateTime> onSelected;

  const AppDateField({
    super.key,
    required this.value,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate:
              value ?? DateTime(2000),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );

        if (picked != null) {
          onSelected(picked);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: "Date de naissance",
          prefixIcon:
              const Icon(Icons.calendar_today),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(16),
          ),
        ),
        child: Text(
          value == null
              ? "Choisir une date"
              : DateFormat(
                  "dd/MM/yyyy",
                ).format(value!),
        ),
      ),
    );
  }
}