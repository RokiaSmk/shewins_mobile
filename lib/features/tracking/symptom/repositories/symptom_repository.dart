import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../requests/create_symptom_request.dart';
import '../requests/update_symptom_request.dart';

import '../responses/symptom_list_response.dart';
import '../responses/symptom_response.dart';

class SymptomRepository {
  final Dio _dio = ApiClient.dio;

  Future<SymptomResponse> createSymptom(
    CreateSymptomRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.symptoms,
      data: request.toJson(),
    );

    return SymptomResponse.fromJson(response.data);
  }

  Future<SymptomListResponse> getCycleSymptoms(
    String cycleId,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.cycles}/$cycleId/symptoms",
    );

    return SymptomListResponse.fromJson(response.data);
  }

  Future<SymptomListResponse> getMemberSymptoms() async {
    final response = await _dio.get(
      ApiConstants.symptoms,
    );

    return SymptomListResponse.fromJson(response.data);
  }

  Future<SymptomResponse> updateSymptom(
    String symptomId,
    UpdateSymptomRequest request,
  ) async {
    final response = await _dio.put(
      "${ApiConstants.symptoms}/$symptomId",
      data: request.toJson(),
    );

    return SymptomResponse.fromJson(response.data);
  }

  Future<void> deleteSymptom(
    String symptomId,
  ) async {
    await _dio.delete(
      "${ApiConstants.symptoms}/$symptomId",
    );
  }
}