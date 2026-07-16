import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../analytics/nutrition/widgets/food_search_bottom_sheet.dart';
import '../../../analytics/nutrition/models/food_knowledge.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';

import '../models/enums/meal_type.dart';
import '../models/food_journal.dart';

import '../providers/food_notifier.dart';

import '../requests/create_food_journal_request.dart';
import '../requests/update_food_journal_request.dart';

class FoodForm extends ConsumerStatefulWidget {
  final String cycleId;
  final FoodJournal? journal;

  const FoodForm({super.key, required this.cycleId, this.journal});

  @override
  ConsumerState<FoodForm> createState() => _FoodFormState();
}

class _FoodFormState extends ConsumerState<FoodForm> {
  late MealType selectedMeal;

  late DateTime mealDate;

  List<FoodKnowledge> selectedFoods = [];

  @override
  void initState() {
    super.initState();

    selectedMeal = widget.journal?.mealType ?? MealType.breakfast;

    mealDate = widget.journal?.mealDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(foodProvider).isLoading;

    return ListView(
      children: [
        AppCard(
          title: "Journal alimentaire",
          icon: Icons.restaurant_menu,
          child: Column(
            children: [
              DropdownButtonFormField<MealType>(
                value: selectedMeal,
                decoration: const InputDecoration(labelText: "Repas"),
                items: MealType.values.map((meal) {
                  return DropdownMenuItem(value: meal, child: Text(meal.label));
                }).toList(),
                onChanged: (value) {
                  if (value == null) return;

                  setState(() {
                    selectedMeal = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "${mealDate.day}/${mealDate.month}/${mealDate.year}",
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: mealDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now(),
                  );

                  if (picked != null) {
                    setState(() {
                      mealDate = picked;
                    });
                  }
                },
              ),

              const SizedBox(height: 20),

              OutlinedButton.icon(
                icon: const Icon(Icons.restaurant_menu),
                label: const Text("Choisir des aliments"),
                onPressed: () async {
                  final foods = await showModalBottomSheet<List<FoodKnowledge>>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => const FoodSearchBottomSheet(),
                  );

                  if (foods != null) {
                    setState(() {
                      selectedFoods = foods;
                    });
                  }
                },
              ),

              const SizedBox(height: 16),

              if (selectedFoods.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: selectedFoods
                      .map(
                        (food) => Chip(
                          avatar: const Icon(Icons.restaurant, size: 18),
                          label: Text(food.foodName),
                        ),
                      )
                      .toList(),
                ),

              const SizedBox(height: 30),

              AppButton(
                text: widget.journal == null ? "Enregistrer" : "Mettre à jour",
                isLoading: loading,
                onPressed: () async {
                  final ids = selectedFoods.map((food) => food.id).toList();

                  if (ids.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Veuillez sélectionner au moins un aliment.",
                        ),
                      ),
                    );

                    return;
                  }

                  bool success;

                  if (widget.journal == null) {
                    success = await ref
                        .read(foodProvider.notifier)
                        .createFoodJournal(
                          CreateFoodJournalRequest(
                            cycleId: widget.cycleId,
                            mealType: selectedMeal,
                            foodIds: ids,
                            mealDate: mealDate,
                          ),
                        );
                  } else {
                    success = await ref
                        .read(foodProvider.notifier)
                        .updateFoodJournal(
                          widget.journal!.id,
                          UpdateFoodJournalRequest(
                            mealType: selectedMeal,
                            foodIds: ids,
                            mealDate: mealDate,
                          ),
                        );
                  }

                  if (!mounted) return;

                  if (success) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
