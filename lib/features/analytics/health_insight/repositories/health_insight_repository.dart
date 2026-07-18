import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../responses/health_insight_response.dart';

class HealthInsightRepository {
  final Dio _dio = ApiClient.dio;

  Future<HealthInsightResponse>
      generateHealthInsight() async {
    final response = await _dio.post(
      ApiConstants.generateHealthInsight,
    );

    return HealthInsightResponse.fromJson(
      response.data,
    );
  }

  Future<HealthInsightResponse>
      getLatestHealthInsight() async {
    final response = await _dio.get(
      ApiConstants.latestHealthInsight,
    );

    return HealthInsightResponse.fromJson(
      response.data,
    );
  }
}