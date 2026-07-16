import '../models/nutrition_analysis.dart';

class NutritionAnalysisResponse {
  final bool success;

  final String message;

  final NutritionAnalysis data;

  const NutritionAnalysisResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NutritionAnalysisResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return NutritionAnalysisResponse(
      success: json["success"],
      message: json["message"],
      data: NutritionAnalysis.fromJson(
        json["data"],
      ),
    );
  }
}