import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/widgets/app_card.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Actions rapides",
      icon: Icons.flash_on_rounded,
      child: Column(
        children: [

          Row(
            children: [

              Expanded(
                child: _QuickActionTile(
                  title: "Cycle",
                  subtitle: "Suivre mes règles",
                  icon: Icons.calendar_month_rounded,
                  color: const Color(0xFFFFE4EC),
                  onTap: () =>
                      context.push(AppRoutes.myCycles),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _QuickActionTile(
                  title: "Symptômes",
                  subtitle: "Ajouter",
                  icon: Icons.favorite_outline,
                  color: const Color(0xFFEDE7FF),
                  onTap: () =>
                      context.push(AppRoutes.symptoms),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [

              Expanded(
                child: _QuickActionTile(
                  title: "Humeur",
                  subtitle: "Comment allez-vous ?",
                  icon: Icons.emoji_emotions_outlined,
                  color: const Color(0xFFFFF5D9),
                  onTap: () =>
                      context.push(AppRoutes.emotions),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: _QuickActionTile(
                  title: "Repas",
                  subtitle: "Journal alimentaire",
                  icon: Icons.restaurant_menu_rounded,
                  color: const Color(0xFFE3F8EC),
                  onTap: () =>
                      context.push(AppRoutes.foods),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () =>
                      context.push(AppRoutes.community),
                  icon: const Icon(Icons.groups_outlined),
                  label: const Text("Communauté"),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () =>
                      context.push(AppRoutes.reports),
                  icon: const Icon(Icons.description_outlined),
                  label: const Text("Rapports"),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}