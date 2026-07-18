class GenerateReportRequest {
  final String period;

  const GenerateReportRequest({
    this.period = "GLOBAL",
  });

  Map<String, dynamic> toJson() {
    return {
      "period": period,
    };
  }
}