import 'package:flutter/material.dart';

class LogoutTile extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutTile({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.red.shade100,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 4,
        ),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFFFEBEE),
          child: Icon(
            Icons.logout_rounded,
            color: Colors.red,
          ),
        ),
        title: const Text(
          "Déconnexion",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 15.5,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.red.shade300,
          size: 16,
        ),
        onTap: onLogout,
      ),
    );
  }
}