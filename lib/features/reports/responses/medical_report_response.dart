import '../models/medical_report.dart';

class MedicalReportResponse {
  final bool success;
  final String message;
  final MedicalReport data;

  const MedicalReportResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MedicalReportResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MedicalReportResponse(
      success: json["success"],
      message: json["message"],
      data: MedicalReport.fromJson(
        json["data"],
      ),
    );
  }
}