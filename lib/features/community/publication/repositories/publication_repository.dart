import 'package:dio/dio.dart';

import '../../../../../core/network/api_client.dart';

import '../requests/create_publication_request.dart';
import '../requests/update_publication_request.dart';

import '../responses/publication_list_response.dart';
import '../responses/publication_response.dart';
import '../../../../core/network/api_constants.dart';

class PublicationRepository {
  final Dio _dio = ApiClient.dio;

  Future<PublicationResponse> createPublication(
    CreatePublicationRequest request,
  ) async {
    final response = await _dio.post(ApiConstants.publications);

    return PublicationResponse.fromJson(response.data);
  }

  Future<PublicationListResponse> getAllPublications() async {
    final response = await _dio.get(ApiConstants.publications);

    return PublicationListResponse.fromJson(response.data);
  }

  Future<PublicationListResponse> getMyPublications() async {
    final response = await _dio.get(ApiConstants.myPublications);

    return PublicationListResponse.fromJson(response.data);
  }

  Future<PublicationResponse> getPublication(String publicationId) async {
    final response = await _dio.get(
      "${ApiConstants.publications}/$publicationId",
    );

    return PublicationResponse.fromJson(response.data);
  }

  Future<PublicationResponse> updatePublication(
    String publicationId,
    UpdatePublicationRequest request,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.publications}/$publicationId",
    );

    return PublicationResponse.fromJson(response.data);
  }

  Future<void> deletePublication(String publicationId) async {
    await _dio.get("${ApiConstants.publications}/$publicationId");
  }
}
