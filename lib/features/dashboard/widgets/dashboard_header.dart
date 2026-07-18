import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';

import '../../notifications/providers/notification_notifier.dart';
import '../../profile/providers/profile_notifier.dart';
import '../../tracking/cycle/providers/cycle_notifier.dart';
import '../../tracking/emotion/providers/emotion_notifier.dart';
import '../../tracking/food/providers/food_notifier.dart';
import '../../tracking/symptom/providers/symptom_notifier.dart';
import '../../auth/providers/auth_notifier.dart';

class DashboardHeader extends ConsumerWidget {
  const DashboardHeader({
    super.key,
  });

 @override
Widget build(BuildContext context, WidgetRef ref) {
  final profile = ref.watch(profileProvider).profile;
  final notificationState = ref.watch(notificationProvider);

  final unreadCount = notificationState.unreadNotifications.length;

  final firstName = profile?.firstName ?? "";
  final lastName = profile?.lastName ?? "";

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Bonjour 👋",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                    [
                      firstName,
                      lastName,
                    ].where((e) => e.isNotEmpty).join(" "),
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                const SizedBox(height: 8),

                Text(
                  "Prenez soin de vous aujourd'hui 🌸",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          _NotificationButton(
            unreadCount: unreadCount,
          ),

          const SizedBox(width: 12),

          _ProfileMenu(),
        ],
      ),

      const SizedBox(height: 24),

      _WelcomeCard(),
    ],
  );
}
}
class _NotificationButton extends StatelessWidget {
  final int unreadCount;

  const _NotificationButton({
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [

        Material(
          color: Colors.pink.shade50,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              context.push(AppRoutes.notifications);
            },
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Icon(
                Icons.notifications_outlined,
              ),
            ),
          ),
        ),

        if (unreadCount > 0)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 3,
              ),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount > 9
                    ? "9+"
                    : unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _WelcomeCard extends ConsumerWidget{
  const _WelcomeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cycleState = ref.watch(cycleProvider);
    final symptomState = ref.watch(symptomProvider);
    final emotionState = ref.watch(emotionProvider);
    final foodState = ref.watch(foodProvider);

    final cycle = cycleState.profile;
    final symptomsCount = symptomState.symptoms.length;
    final mealsCount = foodState.journals.length;
    final latestEmotion = emotionState.emotions.isEmpty
    ? "Aucune"
    : emotionState.emotions.first.mood.label;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: [
            Colors.pink.shade100,
            Colors.purple.shade100,
          ],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "🌸 Votre suivi du jour",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          SizedBox(height: 12),

          Text(
            "Continuez à enregistrer vos symptômes, votre humeur et votre alimentation pour obtenir des recommandations personnalisées.",
          ),
        ],
      ),
    );
  }
}
class _ProfileMenu extends ConsumerWidget {
  const _ProfileMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      onSelected: (value) async {
        switch (value) {
          case "profile":
            context.push(AppRoutes.profile);
            break;

          case "settings":
            context.push(AppRoutes.settings);
            break;

          case "logout":
            await ref.read(authProvider.notifier).logout();

            if (context.mounted) {
              context.go(AppRoutes.login);
            }
            break;
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: "profile",
          child: Row(
            children: [
              Icon(Icons.person_outline),
              SizedBox(width: 10),
              Text("Mon profil"),
            ],
          ),
        ),
        PopupMenuItem(
          value: "settings",
          child: Row(
            children: [
              Icon(Icons.settings_outlined),
              SizedBox(width: 10),
              Text("Paramètres"),
            ],
          ),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: "logout",
          child: Row(
            children: [
              Icon(
                Icons.logout,
                color: Colors.red,
              ),
              SizedBox(width: 10),
              Text(
                "Déconnexion",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.purple.shade50,
        child: Icon(
          Icons.person,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}