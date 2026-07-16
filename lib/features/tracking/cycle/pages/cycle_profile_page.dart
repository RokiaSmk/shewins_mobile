import 'package:flutter/material.dart';

import '../widgets/cycle_profile_form.dart';

class CycleProfilePage extends StatelessWidget {
  const CycleProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil menstruel"),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: CycleProfileForm(),
        ),
      ),
    );
  }
}