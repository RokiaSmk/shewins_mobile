import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class CountryPickerField extends StatelessWidget {
  final Country? selectedCountry;
  final ValueChanged<Country> onSelected;

  const CountryPickerField({
    super.key,
    required this.selectedCountry,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          labelText: "Pays",
          prefixIcon: const Icon(Icons.public),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
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
              ),
            ),

            if (selectedCountry != null)
              Text(
                "+${selectedCountry!.phoneCode}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

            const SizedBox(width: 8),

            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}