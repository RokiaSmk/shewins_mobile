import '../models/food_knowledge.dart';

class FoodKnowledgeListResponse {
  final bool success;
  final String message;
  final List<FoodKnowledge> data;

  const FoodKnowledgeListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FoodKnowledgeListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodKnowledgeListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map(
            (e) => FoodKnowledge.fromJson(e),
          )
          .toList(),
    );
  }
}