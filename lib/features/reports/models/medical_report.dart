class MedicalReport {
  final String id;
  final String period;
  final DateTime generatedAt;
  final String summary;
  final String format;
  final String reportUrl;

  const MedicalReport({
    required this.id,
    required this.period,
    required this.generatedAt,
    required this.summary,
    required this.format,
    required this.reportUrl,
  });

  factory MedicalReport.fromJson(
    Map<String, dynamic> json,
  ) {
    return MedicalReport(
      id: json["id"],
      period: json["period"],
      generatedAt: DateTime.parse(
        json["generatedAt"],
      ),
      summary: json["summary"],
      format: json["format"],
      reportUrl: json["reportUrl"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "period": period,
      "generatedAt":
          generatedAt.toIso8601String(),
      "summary": summary,
      "format": format,
      "reportUrl": reportUrl,
    };
  }
}