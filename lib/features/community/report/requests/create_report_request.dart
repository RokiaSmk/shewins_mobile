import '../models/enums/report_reason.dart';

class CreateReportRequest {
  final ReportReason reason;

  final String? description;

  const CreateReportRequest({
    required this.reason,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "reason": reason.value,
      "description": description,
    };
  }
}