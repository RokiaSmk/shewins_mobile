import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../widgets/logout_tile.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/auth_service.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF8F5FA),
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          "Paramètres",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SettingsHeader(),

            const SizedBox(height: 28),

            SettingsSection(
              title: "Compte",
              children: [
                SettingsTile(
                  icon: Icons.person_outline_rounded,
                  color: Colors.pink,
                  title: "Modifier le profil",
                  onTap: () => context.push(AppRoutes.editProfile),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SettingsSection(
              title: "Préférences",
              children: [
                SettingsTile(
                  icon: Icons.notifications_none_rounded,
                  color: Colors.orange,
                  title: "Notifications",
                  onTap: () =>
                      context.push(AppRoutes.notificationSettings),
                ),
                SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  color: Colors.indigo,
                  title: "Thème",
                  onTap: () => context.push(AppRoutes.theme),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SettingsSection(
              title: "Confidentialité",
              children: [
                SettingsTile(
                  icon: Icons.privacy_tip_outlined,
                  color: Colors.blue,
                  title: "Confidentialité",
                  onTap: () => context.push(AppRoutes.privacy),
                ),
                SettingsTile(
                  icon: Icons.delete_forever_outlined,
                  color: Colors.red,
                  title: "Supprimer mon compte",
                  onTap: () => context.push(AppRoutes.deleteAccount),
                ),
              ],
            ),

            const SizedBox(height: 24),

            SettingsSection(
              title: "Support",
              children: [
                SettingsTile(
                  icon: Icons.help_outline_rounded,
                  color: Colors.teal,
                  title: "Aide",
                  onTap: () => context.push(AppRoutes.help),
                ),
                SettingsTile(
                  icon: Icons.info_outline_rounded,
                  color: Colors.grey,
                  title: "À propos",
                  onTap: () => context.push(AppRoutes.about),
                ),
              ],
            ),

            const SizedBox(height: 30),

            LogoutTile(
              onLogout: () => AuthService.logout(
                context: context,
                ref: ref,
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}