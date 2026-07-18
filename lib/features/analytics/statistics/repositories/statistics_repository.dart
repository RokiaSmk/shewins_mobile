import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../responses/statistics_response.dart';

class StatisticsRepository {
  final Dio _dio = ApiClient.dio;

  Future<StatisticsResponse> generateStatistics() async {
    final response = await _dio.post(
      ApiConstants.generateStatistics,
    );

    return StatisticsResponse.fromJson(
      response.data,
    );
  }

  Future<StatisticsResponse> getLatestStatistics() async {
    final response = await _dio.get(
      ApiConstants.latestStatistics,
    );

    return StatisticsResponse.fromJson(
      response.data,
    );
  }
}