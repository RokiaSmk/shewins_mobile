import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  Widget buildSection({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(.12),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5FA),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Confidentialité",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Chez SheWins, la protection de vos données personnelles et de vos informations de santé est une priorité.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 24),

          buildSection(
            icon: Icons.lock_outline_rounded,
            color: Colors.blue,
            title: "Protection des données",
            description:
                "Vos informations personnelles sont utilisées uniquement pour le fonctionnement de l'application et ne sont jamais partagées avec des tiers sans votre consentement.",
          ),

          buildSection(
            icon: Icons.favorite_outline,
            color: Colors.pink,
            title: "Données de santé",
            description:
                "Les informations relatives à votre cycle menstruel, vos symptômes et votre profil de santé sont traitées de manière confidentielle afin de personnaliser votre expérience dans SheWins.",
          ),

          buildSection(
            icon: Icons.security_outlined,
            color: Colors.green,
            title: "Sécurité",
            description:
                "Nous mettons en œuvre des mécanismes de sécurité afin de protéger vos données contre les accès non autorisés et de préserver leur confidentialité.",
          ),

          buildSection(
            icon: Icons.verified_user_outlined,
            color: Colors.deepPurple,
            title: "Vos droits",
            description:
                "Vous pouvez consulter et modifier les informations de votre profil à tout moment. La suppression définitive du compte sera disponible dans une prochaine version de l'application.",
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4EC),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: Color(0xFFD81B60),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "SheWins s'engage à respecter la confidentialité des informations de ses utilisatrices. Cette page présente un résumé des principes appliqués dans l'application et ne remplace pas une politique de confidentialité juridique complète.",
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}