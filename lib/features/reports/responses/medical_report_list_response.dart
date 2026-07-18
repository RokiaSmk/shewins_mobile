import '../models/medical_report.dart';

class MedicalReportListResponse {
  final bool success;
  final String message;
  final List<MedicalReport> data;

  const MedicalReportListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MedicalReportListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MedicalReportListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map(
            (e) =>
                MedicalReport.fromJson(e),
          )
          .toList(),
    );
  }
}