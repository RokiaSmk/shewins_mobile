import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState
    extends State<NotificationSettingsPage> {
  bool cycleReminders = true;
  bool medicationReminders = true;
  bool healthTips = true;
  bool communityNotifications = false;
  bool generalNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5FA),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Choisissez les notifications que vous souhaitez recevoir.",
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 24),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.pink,
                  ),
                  title: const Text("Rappels du cycle"),
                  subtitle: const Text(
                    "Recevoir un rappel avant vos prochaines règles.",
                  ),
                  value: cycleReminders,
                  onChanged: (value) {
                    setState(() {
                      cycleReminders = value;
                    });
                  },
                ),
                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(
                    Icons.medication_rounded,
                    color: Colors.deepPurple,
                  ),
                  title: const Text("Prise de médicaments"),
                  subtitle: const Text(
                    "Recevoir des rappels pour vos traitements.",
                  ),
                  value: medicationReminders,
                  onChanged: (value) {
                    setState(() {
                      medicationReminders = value;
                    });
                  },
                ),
                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                  ),
                  title: const Text("Conseils santé"),
                  subtitle: const Text(
                    "Recevoir des conseils liés à votre santé féminine.",
                  ),
                  value: healthTips,
                  onChanged: (value) {
                    setState(() {
                      healthTips = value;
                    });
                  },
                ),
                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(
                    Icons.groups_outlined,
                    color: Colors.teal,
                  ),
                  title: const Text("Communauté"),
                  subtitle: const Text(
                    "Être informée des nouvelles interactions.",
                  ),
                  value: communityNotifications,
                  onChanged: (value) {
                    setState(() {
                      communityNotifications = value;
                    });
                  },
                ),
                const Divider(height: 1),

                SwitchListTile(
                  secondary: const Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.orange,
                  ),
                  title: const Text("Notifications générales"),
                  subtitle: const Text(
                    "Recevoir les annonces importantes de SheWins.",
                  ),
                  value: generalNotifications,
                  onChanged: (value) {
                    setState(() {
                      generalNotifications = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Text(
            "Ces préférences concernent uniquement les notifications envoyées par SheWins. Vous pouvez également gérer les autorisations de notification depuis les paramètres de votre téléphone.",
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}