import 'package:flutter/material.dart';

import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_text_field.dart';

class BioCard extends StatelessWidget {
  final TextEditingController bioController;

  const BioCard({
    super.key,
    required this.bioController,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      title: "À propos de vous",
      icon: Icons.edit_note_outlined,
      child: AppTextField(
        controller: bioController,
        label: "Bio",
        hint: "Parlez-nous un peu de vous...",
        prefixIcon: Icons.person_outline,
        maxLines: 4,
      ),
    );
  }
}