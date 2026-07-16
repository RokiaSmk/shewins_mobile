import 'enums/food_category.dart';
import 'enums/food_origin.dart';
import 'enums/recommendation_level.dart';

class FoodKnowledge {
  final String id;
  final String foodName;

  final FoodCategory category;

  final int? glycemicIndex;

  final bool richInFiber;
  final bool richInProtein;
  final bool antiInflammatory;

  final bool recommendedForPcos;
  final bool recommendedForEndometriosis;

  final RecommendationLevel recommendationLevel;

  final String? recommendation;
  final String? description;

  final List<String> alternatives;

  final FoodOrigin origin;

  const FoodKnowledge({
    required this.id,
    required this.foodName,
    required this.category,
    this.glycemicIndex,
    required this.richInFiber,
    required this.richInProtein,
    required this.antiInflammatory,
    required this.recommendedForPcos,
    required this.recommendedForEndometriosis,
    required this.recommendationLevel,
    this.recommendation,
    this.description,
    required this.alternatives,
    required this.origin,
  });

  factory FoodKnowledge.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodKnowledge(
      id: json["id"],
      foodName: json["foodName"],

      category: FoodCategory.fromJson(
        json["category"],
      ),

      glycemicIndex: json["glycemicIndex"],

      richInFiber: json["richInFiber"],

      richInProtein: json["richInProtein"],

      antiInflammatory:
          json["antiInflammatory"],

      recommendedForPcos:
          json["recommendedForPcos"],

      recommendedForEndometriosis:
          json["recommendedForEndometriosis"],

      recommendationLevel:
          RecommendationLevel.fromJson(
        json["recommendationLevel"],
      ),

      recommendation:
          json["recommendation"],

      description:
          json["description"],

      alternatives:
          List<String>.from(
        json["alternatives"],
      ),

      origin: FoodOrigin.fromJson(
        json["origin"],
      ),
    );
  }
}