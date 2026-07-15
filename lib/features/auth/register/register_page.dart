import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_routes.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_password_field.dart';
import '../../../core/widgets/app_text_field.dart';
import '../providers/auth_notifier.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),

                Hero(
                  tag: "app_logo",
                  child: Image.asset(AppAssets.symbol, width: 90),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Créer un compte",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  "Rejoignez SheWins et commencez votre suivi de santé.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 40),

                AppTextField(
                  controller: firstNameController,
                  label: "Prénom",
                  hint: "Votre prénom",
                  prefixIcon: Icons.person_outline,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: lastNameController,
                  label: "Nom",
                  hint: "Votre nom",
                  prefixIcon: Icons.badge_outlined,
                ),

                const SizedBox(height: 20),

                AppTextField(
                  controller: emailController,
                  label: "Adresse e-mail",
                  hint: "exemple@email.com",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                ),

                const SizedBox(height: 20),

                AppPasswordField(
                  controller: passwordController,
                  label: "Mot de passe",
                ),

                const SizedBox(height: 20),

                AppPasswordField(
                  controller: confirmPasswordController,
                  label: "Confirmer le mot de passe",
                ),

                const SizedBox(height: 32),

                AppButton(
                  text: "Créer mon compte",
                  isLoading: isLoading,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    final response = await ref
                        .read(authProvider.notifier)
                        .register(
                          firstName: firstNameController.text.trim(),
                          lastName: lastNameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );

                    if (!mounted) return;

                    if (response != null && response.success) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(response.message)));

                      context.go(AppRoutes.login);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Impossible de créer le compte."),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous avez déjà un compte ?"),
                    TextButton(
                      onPressed: () {
                        context.go(AppRoutes.login);
                      },
                      child: const Text("Se connecter"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
