import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/app_button.dart';
import 'package:country_picker/src/country_service.dart';

import '../../profile/models/blood_group.dart';
import '../../profile/providers/profile_notifier.dart';

import '../../profile/widgets/bio_card.dart';
import '../../profile/widgets/health_information_card.dart';
import '../../profile/widgets/location_information_card.dart';
import '../../profile/widgets/personal_information_card.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() =>
      _EditProfilePageState();
}

class _EditProfilePageState
    extends ConsumerState<EditProfilePage> {
  // =======================================================
  // FORM KEY
  // =======================================================

  final _formKey = GlobalKey<FormState>();

  // =======================================================
  // CONTROLLERS
  // =======================================================

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();

  // =======================================================
  // VARIABLES
  // =======================================================

  DateTime? dateOfBirth;
  Country? selectedCountry;
  BloodGroup? selectedBloodGroup;

  @override
  void initState() {
    super.initState();

    final profile = ref.read(profileProvider).profile;

    if (profile == null) return;

    heightController.text = profile.height.toString();
    weightController.text = profile.weight.toString();
    cityController.text = profile.city;
    phoneController.text = profile.phoneNumber;
    bioController.text = profile.bio;

    dateOfBirth = profile.dateOfBirth;
    selectedBloodGroup = profile.bloodGroup;

    // Pré-sélection du pays
    try {
      selectedCountry = CountryService().getAll().firstWhere(
        (country) =>
            country.name.toLowerCase() ==
            profile.country.toLowerCase(),
      );
    } catch (_) {
      selectedCountry = null;
    }
  }

  // =======================================================
  // DISPOSE
  // =======================================================

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    cityController.dispose();
    phoneController.dispose();
    bioController.dispose();
    super.dispose();
  }

  // =======================================================
  // BUILD
  // =======================================================

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Modifier le profil"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===================================================
                // TITRE
                // ===================================================

                const Text(
                  "Modifier mon profil",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Mettez à jour vos informations personnelles.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                // ===================================================
                // INFORMATIONS PERSONNELLES
                // ===================================================

                PersonalInformationCard(
                  dateOfBirth: dateOfBirth,
                  onDateSelected: (date) {
                    setState(() {
                      dateOfBirth = date;
                    });
                  },
                ),

                const SizedBox(height: 24),

                // ===================================================
                // LOCALISATION
                // ===================================================

                LocationInformationCard(
                  selectedCountry: selectedCountry,
                  onCountrySelected: (country) {
                    setState(() {
                      selectedCountry = country;
                    });
                  },
                  cityController: cityController,
                  phoneController: phoneController,
                ),

                const SizedBox(height: 24),

                // ===================================================
                // SANTÉ
                // ===================================================

                HealthInformationCard(
                  heightController: heightController,
                  weightController: weightController,
                  selectedBloodGroup: selectedBloodGroup,
                  onBloodGroupChanged: (value) {
                    setState(() {
                      selectedBloodGroup = value;
                    });
                  },
                ),

                const SizedBox(height: 24),

                // ===================================================
                // BIO
                // ===================================================

                BioCard(
                  bioController: bioController,
                ),

                const SizedBox(height: 32),

                // ===================================================
                // BOUTON
                // ===================================================

                AppButton(
                  text: "Enregistrer",
                  isLoading: state.isLoading,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    if (dateOfBirth == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Veuillez sélectionner votre date de naissance.",
                          ),
                        ),
                      );
                      return;
                    }

                    if (selectedCountry == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Veuillez sélectionner votre pays.",
                          ),
                        ),
                      );
                      return;
                    }

                    if (selectedBloodGroup == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Veuillez sélectionner votre groupe sanguin.",
                          ),
                        ),
                      );
                      return;
                    }

                    final height =
                        double.tryParse(heightController.text);

                    final weight =
                        double.tryParse(weightController.text);

                    if (height == null || weight == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Veuillez saisir une taille et un poids valides.",
                          ),
                        ),
                      );
                      return;
                    }

                    final response = await ref
                          .read(profileProvider.notifier)
                          .updateProfile(
                          dateOfBirth: dateOfBirth!,
                          height: height,
                          weight: weight,
                          bloodGroup: selectedBloodGroup!,
                          country: selectedCountry!.name,
                          city: cityController.text.trim(),

                          phoneNumber:
                              "+${selectedCountry!.phoneCode}${phoneController.text.trim()}",

                          profilePicture: "",

                          bio: bioController.text.trim(),
                        );

                    if (!mounted) return;

                    if (response != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Profil mis à jour avec succès.",
                          ),
                        ),
                      );

                      // À remplacer par Dashboard quand il sera prêt
                      context.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Une erreur est survenue.",
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}