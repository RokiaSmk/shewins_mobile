import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  Widget buildInfoTile({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(.12),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(value),
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
          "À propos",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Icon(
            Icons.favorite,
            color: Color(0xFFD81B60),
            size: 80,
          ),

          const SizedBox(height: 16),

          const Center(
            child: Text(
              "SheWins",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Center(
            child: Text(
              "Plateforme intelligente de suivi de la santé féminine",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ),

          const SizedBox(height: 30),

          Container(
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
            child: Column(
              children: [
                buildInfoTile(
                  icon: Icons.info_outline,
                  color: Colors.blue,
                  title: "Version",
                  value: "1.0.0",
                ),
                const Divider(height: 1),
                buildInfoTile(
                  icon: Icons.school_outlined,
                  color: Colors.deepPurple,
                  title: "Projet",
                  value:
                      "Projet académique de Master en Ingénierie des Systèmes d'Information.",
                ),
                const Divider(height: 1),
                buildInfoTile(
                  icon: Icons.favorite_outline,
                  color: Colors.pink,
                  title: "Mission",
                  value:
                      "Accompagner les femmes dans le suivi de leur santé gynécologique grâce à des outils numériques intelligents.",
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE4EC),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Text(
              "Merci d'utiliser SheWins 💜\n\nNotre objectif est d'offrir une application fiable, intuitive et accessible pour accompagner les femmes dans le suivi de leur santé au quotidien.",
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.7),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}