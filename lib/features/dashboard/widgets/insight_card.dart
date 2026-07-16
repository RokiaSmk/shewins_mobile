import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';
class InsightCard extends StatelessWidget {
  const InsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCard(
      icon: Icons.lightbulb_outline,
      title: "Conseil du jour",
      child: Text(
        "Vos conseils personnalisés apparaîtront ici au fur et à mesure de votre suivi.",
      ),
    );
  }
}