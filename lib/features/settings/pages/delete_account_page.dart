import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes.dart';
import '../../auth/providers/auth_notifier.dart';
import '../../profile/providers/profile_notifier.dart';

class DeleteAccountPage extends ConsumerWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Supprimer le compte"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 90,
            ),

            const SizedBox(height: 24),

            const Text(
              "Suppression définitive",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              "Cette action est irréversible.\n\n"
              "Votre compte ainsi que toutes vos données personnelles seront supprimés définitivement.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size.fromHeight(56),
              ),
              onPressed: isLoading
                  ? null
                  : () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text("Confirmer"),
                          content: const Text(
                            "Voulez-vous vraiment supprimer votre compte ?\n\n"
                            "Cette action est définitive.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(context, false),
                              child: const Text("Annuler"),
                            ),
                            FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () =>
                                  Navigator.pop(context, true),
                              child: const Text("Supprimer"),
                            ),
                          ],
                        ),
                      );

                      if (confirm != true) return;

                      final success = await ref
                          .read(authProvider.notifier)
                          .deleteAccount();

                      if (!context.mounted) return;

                      if (success) {
                        ref
                            .read(profileProvider.notifier)
                            .clearProfile();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Compte supprimé avec succès.",
                            ),
                          ),
                        );

                        context.go(AppRoutes.login);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Impossible de supprimer le compte.",
                            ),
                          ),
                        );
                      }
                    },
              icon: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.delete_forever),
              label: Text(
                isLoading
                    ? "Suppression..."
                    : "Supprimer mon compte",
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}