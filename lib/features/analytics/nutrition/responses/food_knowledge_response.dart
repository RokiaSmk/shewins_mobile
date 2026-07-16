import '../models/food_knowledge.dart';

class FoodKnowledgeResponse {
  final bool success;
  final String message;
  final FoodKnowledge data;

  const FoodKnowledgeResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FoodKnowledgeResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodKnowledgeResponse(
      success: json["success"],
      message: json["message"],
      data: FoodKnowledge.fromJson(
        json["data"],
      ),
    );
  }
}