import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_constants.dart';
import '../models/education_response.dart';

class EducationRemoteDataSource {
  Future<List<EducationResponse>> getContents() async {
    final Response response = await ApiClient.dio.get(
      ApiConstants.education,
    );

    final List data = response.data;

    return data
        .map(
          (e) => EducationResponse.fromMap(
            e as Map<String, dynamic>,
          ),
        )
        .toList();
  }

  Future<EducationResponse> getContentById(
    String id,
  ) async {
    final Response response = await ApiClient.dio.get(
      '${ApiConstants.education}/$id',
    );

    return EducationResponse.fromMap(
      response.data as Map<String, dynamic>,
    );
  }
}