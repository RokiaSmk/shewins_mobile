import '../models/food_knowledge.dart';
import '../models/nutrition_analysis.dart';

class NutritionState {
  final bool isLoading;

  final List<FoodKnowledge> foods;

  final NutritionAnalysis? analysis;

  final String search;

  final String? error;

  const NutritionState({
    this.isLoading = false,
    this.foods = const [],
    this.analysis,
    this.search = "",
    this.error,
  });

  NutritionState copyWith({
    bool? isLoading,
    List<FoodKnowledge>? foods,
    NutritionAnalysis? analysis,
    String? search,
    String? error,
  }) {
    return NutritionState(
      isLoading: isLoading ?? this.isLoading,
      foods: foods ?? this.foods,
      analysis: analysis ?? this.analysis,
      search: search ?? this.search,
      error: error,
    );
  }
}