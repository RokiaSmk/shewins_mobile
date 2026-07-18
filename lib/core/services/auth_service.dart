import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_routes.dart';
import '../storage/token_storage.dart';
import '../../features/profile/providers/profile_notifier.dart';

class AuthService {
  AuthService._();

  static Future<void> logout({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Déconnexion"),
        content: const Text(
          "Êtes-vous sûre de vouloir vous déconnecter ?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Annuler"),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Déconnexion"),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    await TokenStorage.deleteToken();

    ref.read(profileProvider.notifier).clearProfile();

    if (context.mounted) {
      context.go(AppRoutes.login);
    }
  }

  static Future<bool> isLoggedIn() async {
    final token = await TokenStorage.getToken();
    return token != null && token.isNotEmpty;
  }
}