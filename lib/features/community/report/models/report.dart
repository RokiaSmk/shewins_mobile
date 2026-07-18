import 'enums/report_reason.dart';
import 'enums/report_status.dart';

class Report {
  final String id;
  final String authorId;

  final ReportReason reason;
  final String? description;

  final ReportStatus status;

  final DateTime createdAt;

  const Report({
    required this.id,
    required this.authorId,
    required this.reason,
    required this.description,
    required this.status,
    required this.createdAt,
  });

  factory Report.fromJson(
    Map<String, dynamic> json,
  ) {
    return Report(
      id: json["id"],
      authorId: json["authorId"],
      reason: ReportReasonExtension.fromString(
        json["reason"],
      ),
      description: json["description"],
      status: ReportStatusExtension.fromString(
        json["status"],
      ),
      createdAt: DateTime.parse(
        json["createdAt"],
      ),
    );
  }
}