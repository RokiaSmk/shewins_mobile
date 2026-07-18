import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../models/profile_response.dart';

class ProfileBioCard extends StatelessWidget {
  final UserProfile profile;

  const ProfileBioCard({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "À propos",
      icon: Icons.edit_note_outlined,
      child: Text(
        profile.bio.isEmpty
            ? "Aucune biographie renseignée."
            : profile.bio,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey.shade700,
          height: 1.6,
        ),
      ),
    );
  }
}