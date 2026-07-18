import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../../core/widgets/app_card.dart';

class ProfileActionsCard extends StatelessWidget {
  const ProfileActionsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Actions",
      icon: Icons.settings_outlined,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () {
                context.push(AppRoutes.editProfile);
              },
              icon: const Icon(Icons.edit_outlined),
              label: const Text("Modifier le profil"),
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                context.push(AppRoutes.settings);
              },
              icon: const Icon(Icons.settings_outlined),
              label: const Text("Paramètres"),
            ),
          ),
        ],
      ),
    );
  }
}