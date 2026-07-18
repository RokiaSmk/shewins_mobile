import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shewins_mobile/features/profile/models/blood_group.dart';

import '../../../core/widgets/app_card.dart';
import '../models/profile_response.dart';

class ProfileInformationCard extends StatelessWidget {
  final UserProfile profile;

  const ProfileInformationCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Informations personnelles",
      icon: Icons.person_outline,
      child: Column(
        children: [
          _InfoTile(
            icon: Icons.cake_outlined,
            title: "Date de naissance",
            value: DateFormat(
              'dd/MM/yyyy',
            ).format(profile.dateOfBirth),
          ),

          const Divider(),

          _InfoTile(
            icon: Icons.public,
            title: "Pays",
            value: profile.country,
          ),

          const Divider(),

          _InfoTile(
            icon: Icons.location_city_outlined,
            title: "Ville",
            value: profile.city,
          ),

          const Divider(),

          _InfoTile(
            icon: Icons.phone_outlined,
            title: "Téléphone",
            value: profile.phoneNumber,
          ),

          const Divider(),

          _InfoTile(
            icon: Icons.height,
            title: "Taille",
            value:
                "${profile.height.toStringAsFixed(0)} cm",
          ),

          const Divider(),

          _InfoTile(
            icon: Icons.monitor_weight_outlined,
            title: "Poids",
            value:
                "${profile.weight.toStringAsFixed(0)} kg",
          ),

          const Divider(),

          _InfoTile(
            icon: Icons.bloodtype_outlined,
            title: "Groupe sanguin",
            value: profile.bloodGroup.label,
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        color: const Color(0xFFD81B60),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(value),
    );
  }
}