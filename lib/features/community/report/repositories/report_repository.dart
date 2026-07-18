import '../../../../../core/network/api_client.dart';

import '../requests/create_report_request.dart';
import '../responses/report_response.dart';
import '../../../../core/network/api_constants.dart';

class ReportRepository {
  Future<ReportResponse> reportPublication(
    String publicationId,
    CreateReportRequest request,
  ) async {
    final response = await ApiClient.dio.post(
      "${ApiConstants.publications}/$publicationId/reports",
      data: request.toJson(),
    );

    return ReportResponse.fromJson(
      response.data,
    );
  }
}