import 'package:flutter/material.dart';

import '../models/profile_response.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile profile;

  const ProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: const Color(0xFFF8D7E8),
          backgroundImage: profile.profilePicture.isNotEmpty
              ? NetworkImage(profile.profilePicture)
              : null,
          child: profile.profilePicture.isEmpty
              ? const Icon(
                  Icons.person,
                  size: 50,
                  color: Color(0xFFD81B60),
                )
              : null,
        ),

        const SizedBox(height: 16),

        Text(
          profile.fullName,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: profile.profileCompleted
                ? Colors.green.shade50
                : Colors.orange.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            profile.profileCompleted
                ? "Profil complété"
                : "Profil incomplet",
            style: TextStyle(
              color: profile.profileCompleted
                  ? Colors.green
                  : Colors.orange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}