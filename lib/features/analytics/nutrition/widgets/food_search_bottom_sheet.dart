import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/app_text_field.dart';
import '../providers/nutrition_notifier.dart';

class FoodSearchBottomSheet extends ConsumerStatefulWidget {
  const FoodSearchBottomSheet({
    super.key,
  });

  @override
  ConsumerState<FoodSearchBottomSheet> createState() =>
      _FoodSearchBottomSheetState();
}

class _FoodSearchBottomSheetState
    extends ConsumerState<FoodSearchBottomSheet> {

  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(nutritionProvider.notifier).loadFoods();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(nutritionProvider);
    final notifier = ref.read(nutritionProvider.notifier);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom:
              MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: SizedBox(
          height: 650,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                "Choisissez vos aliments",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Sélectionnez un ou plusieurs aliments.",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 20),

              AppTextField(
                controller: searchController,
                label: "Recherche",
                hint: "Ex : Riz, Banane, Avocat...",
                prefixIcon: Icons.search,
                onChanged: notifier.searchFoods,
              ),

              const SizedBox(height: 20),

              Text(
                "${notifier.selectedFoods.length} aliment(s) sélectionné(s)",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              if (notifier.selectedFoods.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: notifier.selectedFoods
                      .map(
                        (food) => Chip(
                          avatar: const Icon(
                            Icons.restaurant,
                            size: 18,
                          ),
                          label: Text(food.foodName),
                          onDeleted: () {
                            notifier.toggleFood(food);
                          },
                        ),
                      )
                      .toList(),
                ),

              const SizedBox(height: 20),

              Expanded(
                child: state.isLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator(),
                      )
                    : ListView.separated(
                        itemCount: state.foods.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1),
                        itemBuilder: (_, index) {

                          final food =
                              state.foods[index];

                          return CheckboxListTile(
                            controlAffinity:
                                ListTileControlAffinity.leading,
                            value: notifier.isSelected(
                              food.id,
                            ),
                            title: Text(
                              food.foodName,
                            ),
                            subtitle: Text(
                              "${food.category.label} • ${food.recommendationLevel.label}",
                            ),
                            secondary: Icon(
                              Icons.restaurant_menu,
                              color: Theme.of(context)
                                  .primaryColor,
                            ),
                            onChanged: (_) {
                              notifier.toggleFood(food);
                            },
                          );
                        },
                      ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text(
                    "Valider la sélection",
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      notifier.selectedFoods,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}