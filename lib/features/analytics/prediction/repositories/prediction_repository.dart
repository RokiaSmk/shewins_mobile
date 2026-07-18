import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../responses/prediction_response.dart';

class PredictionRepository {
  final Dio _dio = ApiClient.dio;

  Future<PredictionResponse> generatePrediction() async {
    final response = await _dio.post(
      ApiConstants.generatePrediction,
    );

    return PredictionResponse.fromJson(
      response.data,
    );
  }

  Future<PredictionResponse> getLatestPrediction() async {
    final response = await _dio.get(
      ApiConstants.latestPrediction,
    );

    return PredictionResponse.fromJson(
      response.data,
    );
  }
}