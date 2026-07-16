import 'package:flutter/material.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/app_card.dart';

class HealthOverviewCard extends StatelessWidget {
  const HealthOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Votre santé",
      icon: Icons.favorite_rounded,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Continuez votre suivi pour recevoir des analyses personnalisées.",
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text("Commencer"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Image.asset(
            AppAssets.symbol,
            width: 70,
            height: 70,
          ),
        ],
      ),
    );
  }
}