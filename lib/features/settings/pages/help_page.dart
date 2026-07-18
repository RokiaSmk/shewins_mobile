import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  Widget buildCard({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.12),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
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
          "Aide",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            "Besoin d'aide ? Retrouvez ici les réponses aux questions les plus fréquentes concernant l'utilisation de SheWins.",
            style: TextStyle(
              color: Colors.grey.shade700,
              height: 1.6,
            ),
          ),

          const SizedBox(height: 24),

          buildCard(
            icon: Icons.calendar_month,
            color: Colors.pink,
            title: "Suivi du cycle",
            subtitle:
                "Enregistrez vos cycles, symptômes et informations de santé afin d'obtenir un meilleur suivi.",
          ),

          buildCard(
            icon: Icons.analytics_outlined,
            color: Colors.deepPurple,
            title: "Analyses",
            subtitle:
                "Consultez les statistiques et les tendances générées à partir de vos données.",
          ),

          buildCard(
            icon: Icons.menu_book_outlined,
            color: Colors.green,
            title: "Bibliothèque Santé",
            subtitle:
                "Accédez à des articles éducatifs sur le SOPK, l'endométriose et la santé féminine.",
          ),

          buildCard(
            icon: Icons.email_outlined,
            color: Colors.orange,
            title: "Contacter le support",
            subtitle:
                "Pour toute question ou difficulté, contactez l'équipe SheWins à l'adresse support@shewins.app",
          ),

          const SizedBox(height: 20),

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
                  Icons.info_outline,
                  color: Color(0xFFD81B60),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Cette application est conçue pour accompagner les utilisatrices dans le suivi de leur santé féminine. Les informations fournies ne remplacent pas l'avis d'un professionnel de santé.",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}