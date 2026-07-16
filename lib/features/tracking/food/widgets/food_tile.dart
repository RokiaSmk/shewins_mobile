import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_card.dart';

import '../models/food_journal.dart';

import '../providers/food_notifier.dart';

import 'edit_food_bottom_sheet.dart';

class FoodTile extends ConsumerWidget {
  final FoodJournal journal;

  const FoodTile({
    super.key,
    required this.journal,
  });

  @override
  Widget build(
      BuildContext context,
      WidgetRef ref,
      ) {

    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16),
      child: AppCard(
        title: journal.mealType.label,
        icon: Icons.restaurant_menu,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Text(
              "${journal.foodIds.length} aliment(s)",
            ),

            const SizedBox(height: 8),

            Text(
              "${journal.mealDate.day}/${journal.mealDate.month}/${journal.mealDate.year}",
            ),

            Align(
              alignment:
                  Alignment.centerRight,
              child: PopupMenuButton<String>(
                onSelected: (value) async {

                  switch (value) {

                    case "edit":

                      showModalBottomSheet(
                        context: context,
                        isScrollControlled:
                            true,
                        builder: (_) =>
                            EditFoodBottomSheet(
                          journal: journal,
                        ),
                      );

                      break;

                    case "delete":

                      await ref
                          .read(
                            foodProvider
                                .notifier,
                          )
                          .deleteFoodJournal(
                            journal.id,
                          );

                      break;
                  }
                },
                itemBuilder: (_) => const [

                  PopupMenuItem(
                    value: "edit",
                    child: Text(
                      "Modifier",
                    ),
                  ),

                  PopupMenuItem(
                    value: "delete",
                    child: Text(
                      "Supprimer",
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