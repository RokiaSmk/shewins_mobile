import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/country_picker_field.dart';

class LocationInformationCard extends StatelessWidget {
  final Country? selectedCountry;
  final ValueChanged<Country> onCountrySelected;

  final TextEditingController cityController;
  final TextEditingController phoneController;

  const LocationInformationCard({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
    required this.cityController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Localisation",
      icon: Icons.location_on_outlined,
      child: Column(
        children: [
          CountryPickerField(
            selectedCountry: selectedCountry,
            onSelected: onCountrySelected,
          ),

          const SizedBox(height: 20),

          AppTextField(
            controller: cityController,
            label: "Ville",
            hint: "Ex : Dakar",
            prefixIcon: Icons.location_city,
          ),

          const SizedBox(height: 20),

         AppTextField(
            controller: phoneController,
            label: "Téléphone",
            hint: "771234567",
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.phone,
            prefix: selectedCountry == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 8,
                    ),
                    child: Text(
                      "${selectedCountry!.flagEmoji} +${selectedCountry!.phoneCode}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}