import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../responses/food_knowledge_list_response.dart';
import '../responses/food_knowledge_response.dart';
import '../responses/nutrition_analysis_response.dart';

class NutritionRepository {
  final Dio _dio = ApiClient.dio;

  Future<FoodKnowledgeListResponse> getFoods() async {
    final response = await _dio.get(
      ApiConstants.nutrition,
    );

    return FoodKnowledgeListResponse.fromJson(
      response.data,
    );
  }

  Future<FoodKnowledgeResponse> getFood(
    String foodName,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.nutrition}/$foodName",
    );

    return FoodKnowledgeResponse.fromJson(
      response.data,
    );
  }

  Future<FoodKnowledgeListResponse> searchFoods(
    String keyword,
  ) async {
    final response = await _dio.get(
      ApiConstants.nutritionSearch,
      queryParameters: {
        "keyword": keyword,
      },
    );

    return FoodKnowledgeListResponse.fromJson(
      response.data,
    );
  }

  Future<NutritionAnalysisResponse> getNutritionAnalysis() async {
    final response = await _dio.get(
      ApiConstants.nutritionAnalyze,
    );

    return NutritionAnalysisResponse.fromJson(
      response.data,
    );
  }
}