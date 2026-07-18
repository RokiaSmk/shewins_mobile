import '../models/statistics.dart';

class StatisticsResponse {
  final bool success;
  final String message;
  final Statistics data;

  const StatisticsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory StatisticsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return StatisticsResponse(
      success: json["success"],
      message: json["message"],
      data: Statistics.fromJson(
        json["data"],
      ),
    );
  }
}