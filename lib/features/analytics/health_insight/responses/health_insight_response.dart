import '../models/health_insight.dart';

class HealthInsightResponse {
  final bool success;
  final String message;
  final HealthInsight data;

  const HealthInsightResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory HealthInsightResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return HealthInsightResponse(
      success: json["success"],
      message: json["message"],
      data: HealthInsight.fromJson(
        json["data"],
      ),
    );
  }
}