import '../models/menstrual_cycle.dart';

class MenstrualCycleListResponse {
  final bool success;
  final String message;
  final List<MenstrualCycle> data;

  const MenstrualCycleListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MenstrualCycleListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MenstrualCycleListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map((e) => MenstrualCycle.fromJson(e))
          .toList(),
    );
  }
}