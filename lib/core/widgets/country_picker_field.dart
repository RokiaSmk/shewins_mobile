import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class CountryPickerField extends StatelessWidget {
  final Country? selectedCountry;
  final ValueChanged<Country> onSelected;
  final String label;

  const CountryPickerField({
    super.key,
    required this.selectedCountry,
    required this.onSelected,
    this.label = "Pays",
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: true,
          showSearch: true,
          favorite: const [
            'ML',
            'SN',
            'CI',
            'BF',
            'NE',
            'BJ',
            'TG',
            'GN',
            'MR',
            'CM',
            'TD',
            'CF',
            'CG',
            'CD',
            'GA',
            'GQ',
            'DJ',
            'KM',
            'MG',
          ],
          onSelect: onSelected,
        );
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(
            Icons.public,
            color: AppColors.primary,
          ),
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
        ),
        child: Row(
          children: [
            Text(
              selectedCountry?.flagEmoji ?? "🌍",
              style: const TextStyle(fontSize: 24),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                selectedCountry?.name ?? "Choisir un pays",
                style: AppTextStyles.bodyMedium.copyWith(
                  color: selectedCountry == null
                      ? AppColors.lightGrey
                      : AppColors.black,
                ),
              ),
            ),

            if (selectedCountry != null)
              Text(
                "+${selectedCountry!.phoneCode}",
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}