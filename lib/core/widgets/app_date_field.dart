import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppDateField extends StatelessWidget {
  final DateTime? value;
  final ValueChanged<DateTime> onSelected;

  final String label;
  final String hint;
  final IconData icon;

  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;

  final bool enabled;

  const AppDateField({
    super.key,
    required this.value,
    required this.onSelected,
    this.label = "Date",
    this.hint = "Sélectionner une date",
    this.icon = Icons.calendar_month_rounded,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: !enabled
          ? null
          : () async {
              final picked = await showDatePicker(
                context: context,
                initialDate:
                    value ??
                    initialDate ??
                    DateTime.now(),
                firstDate:
                    firstDate ??
                    DateTime(1950),
                lastDate:
                    lastDate ??
                    DateTime(2100),
              );

              if (picked != null) {
                onSelected(picked);
              }
            },
      child: IgnorePointer(
        child: TextFormField(
          enabled: enabled,
          controller: TextEditingController(
            text: value == null
                ? ""
                : DateFormat(
                    "dd/MM/yyyy",
                  ).format(value!),
          ),
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,

            prefixIcon: Icon(
              icon,
              color: AppColors.primary,
            ),

            suffixIcon: const Icon(
              Icons.expand_more_rounded,
            ),

            filled: true,

            fillColor: Colors.white,

            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(18),
            ),

            enabledBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),

            focusedBorder:
                OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}