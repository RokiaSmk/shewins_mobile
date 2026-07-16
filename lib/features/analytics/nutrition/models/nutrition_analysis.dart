class NutritionAnalysis {
  final double nutritionScore;
  final double averageGlycemicIndex;
  final double fiberScore;
  final double proteinScore;
  final double antiInflammatoryScore;

  final List<String> recommendedFoods;
  final List<String> foodsToLimit;
  final List<String> foodsToAvoid;

  const NutritionAnalysis({
    required this.nutritionScore,
    required this.averageGlycemicIndex,
    required this.fiberScore,
    required this.proteinScore,
    required this.antiInflammatoryScore,
    required this.recommendedFoods,
    required this.foodsToLimit,
    required this.foodsToAvoid,
  });

  factory NutritionAnalysis.fromJson(
    Map<String, dynamic> json,
  ) {
    return NutritionAnalysis(
      nutritionScore:
          (json["nutritionScore"] as num).toDouble(),

      averageGlycemicIndex:
          (json["averageGlycemicIndex"] as num)
              .toDouble(),

      fiberScore:
          (json["fiberScore"] as num).toDouble(),

      proteinScore:
          (json["proteinScore"] as num).toDouble(),

      antiInflammatoryScore:
          (json["antiInflammatoryScore"] as num)
              .toDouble(),

      recommendedFoods:
          List<String>.from(
        json["recommendedFoods"],
      ),

      foodsToLimit:
          List<String>.from(
        json["foodsToLimit"],
      ),

      foodsToAvoid:
          List<String>.from(
        json["foodsToAvoid"],
      ),
    );
  }
}