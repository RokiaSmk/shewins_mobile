import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_card.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_routes.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "Accès rapides",
      icon: Icons.flash_on_rounded,
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.6,
        children: [
          _QuickActionTile(
            icon: Icons.calendar_month_rounded,
            title: "Cycle",
            onTap: () {
              context.push(AppRoutes.myCycles);
            },
          ),
          _QuickActionTile(
            icon: Icons.favorite_outline_rounded,
            title: "Symptômes",
            onTap: () {
              context.push(AppRoutes.symptoms);
            },
          ),
          _QuickActionTile(
            icon: Icons.emoji_emotions_outlined,
            title: "Humeur",
            onTap: () {
              context.push(AppRoutes.emotions);
            },
          ),
         _QuickActionTile(
            icon: Icons.restaurant_menu_rounded,
            title: "Repas",
            onTap: () {
              context.push(AppRoutes.foods);
            },
          ),
        ],
      ),
    );
  }
}

class _QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}