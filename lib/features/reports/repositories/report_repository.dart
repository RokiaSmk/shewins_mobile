import 'package:dio/dio.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_constants.dart';

import '../requests/generate_report_request.dart';

import '../responses/medical_report_response.dart';
import '../responses/medical_report_list_response.dart';

class ReportRepository {
  final Dio _dio = ApiClient.dio;

  Future<MedicalReportResponse> generateReport(
    GenerateReportRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.generateReport,
      data: request.toJson(),
    );

    return MedicalReportResponse.fromJson(
      response.data,
    );
  }

  Future<MedicalReportListResponse> getReports() async {
    final response = await _dio.get(
      ApiConstants.reports,
    );

    return MedicalReportListResponse.fromJson(
      response.data,
    );
  }

  Future<MedicalReportResponse> getReport(
    String reportId,
  ) async {
    final response = await _dio.get(
      "${ApiConstants.reports}/$reportId",
    );

    return MedicalReportResponse.fromJson(
      response.data,
    );
  }
}