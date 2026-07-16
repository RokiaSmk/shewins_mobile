import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/food_knowledge.dart';

import '../providers/nutrition_state.dart';

import '../repositories/nutrition_repository.dart';

final nutritionProvider =
    NotifierProvider<NutritionNotifier, NutritionState>(
  NutritionNotifier.new,
);

class NutritionNotifier
    extends Notifier<NutritionState> {

  final NutritionRepository _repository =
      NutritionRepository();

  final List<FoodKnowledge> _selectedFoods = [];

  @override
  NutritionState build() {
    return const NutritionState();
  }

  List<FoodKnowledge> get selectedFoods =>
      List.unmodifiable(_selectedFoods);

  Future<void> loadFoods() async {
    state = state.copyWith(
      isLoading: true,
    );

    try {
      final response =
          await _repository.getFoods();

      state = state.copyWith(
        foods: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> searchFoods(
    String keyword,
  ) async {

    if (keyword.trim().isEmpty) {
      await loadFoods();
      return;
    }

    try {

      final response =
          await _repository.searchFoods(
        keyword,
      );

      state = state.copyWith(
        foods: response.data,
        search: keyword,
      );

    } catch (e) {

      debugPrint(e.toString());

    }
  }

  void toggleFood(
    FoodKnowledge food,
  ) {

    if (_selectedFoods.any(
      (e) => e.id == food.id,
    )) {

      _selectedFoods.removeWhere(
        (e) => e.id == food.id,
      );

    } else {

      _selectedFoods.add(food);

    }

    state = state.copyWith();
  }

  bool isSelected(
    String id,
  ) {

    return _selectedFoods.any(
      (e) => e.id == id,
    );

  }

  void clearSelection() {
    _selectedFoods.clear();

    state = state.copyWith();
  }
  Future<void> loadNutritionAnalysis() async {
  state = state.copyWith(
    isLoading: true,
    error: null,
  );

  try {
    final response =
        await _repository.getNutritionAnalysis();

    state = state.copyWith(
      analysis: response.data,
    );
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
}