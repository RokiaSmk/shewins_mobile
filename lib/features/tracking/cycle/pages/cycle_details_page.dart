import 'package:flutter/material.dart';

class CycleDetailsPage extends StatelessWidget {
  const CycleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails du cycle"),
      ),
      body: const Center(
        child: Text(
          "Cycle Details",
        ),
      ),
    );
  }
}