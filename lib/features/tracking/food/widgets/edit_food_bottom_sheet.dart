import 'package:flutter/material.dart';

import '../models/food_journal.dart';
import 'food_form.dart';

class EditFoodBottomSheet
    extends StatelessWidget {

  final FoodJournal journal;

  const EditFoodBottomSheet({
    super.key,
    required this.journal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom:
            MediaQuery.of(context)
                    .viewInsets
                    .bottom +
                20,
      ),
      child: FoodForm(
        cycleId: journal.cycleId,
        journal: journal,
      ),
    );
  }
}