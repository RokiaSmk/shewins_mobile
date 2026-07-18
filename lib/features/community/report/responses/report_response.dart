import '../models/report.dart';

class ReportResponse {
  final bool success;

  final String message;

  final Report data;

  const ReportResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ReportResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ReportResponse(
      success: json["success"],
      message: json["message"],
      data: Report.fromJson(
        json["data"],
      ),
    );
  }
}