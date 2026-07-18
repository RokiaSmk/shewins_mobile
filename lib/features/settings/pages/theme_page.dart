import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F5FA),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Thème",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.palette_outlined,
              size: 80,
              color: Color(0xFFD81B60),
            ),

            const SizedBox(height: 24),

            const Text(
              "Personnalisation du thème",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "SheWins utilise actuellement un thème clair conçu pour offrir une expérience confortable et harmonieuse. La prise en charge des thèmes sombre et personnalisé sera disponible dans une prochaine version de l'application.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.light_mode_rounded,
                    color: Color(0xFFD81B60),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Le thème clair est actuellement utilisé par défaut dans SheWins.",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}