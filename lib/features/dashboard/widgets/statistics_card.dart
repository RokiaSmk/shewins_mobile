import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      icon: Icons.bar_chart,
      title: "Statistiques",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Cycles suivis"),
              Text("0"),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Symptômes enregistrés"),
              Text("0"),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Jours de suivi"),
              Text("0"),
            ],
          ),
        ],
      ),
    );
  }
}