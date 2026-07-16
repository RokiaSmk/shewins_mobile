import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_routes.dart';
import '../providers/food_notifier.dart';
import '../widgets/food_tile.dart';

class FoodPage extends ConsumerStatefulWidget {
  const FoodPage({super.key});

  @override
  ConsumerState<FoodPage> createState() =>
      _FoodPageState();
}

class _FoodPageState
    extends ConsumerState<FoodPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(foodProvider.notifier)
          .loadMemberFoodJournals();
    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(foodProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Journal alimentaire",
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(
            AppRoutes.createFood,
          );
        },
        child: const Icon(Icons.add),
      ),

      body: state.journals.isEmpty
          ? const Center(
              child: Text(
                "Aucun repas enregistré.",
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.journals.length,
              itemBuilder: (_, index) {
                return FoodTile(
                  journal:
                      state.journals[index],
                );
              },
            ),
    );
  }
}