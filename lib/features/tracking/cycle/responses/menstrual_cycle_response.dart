import '../models/menstrual_cycle.dart';

class MenstrualCycleResponse {
  final bool success;
  final String message;
  final MenstrualCycle data;

  const MenstrualCycleResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MenstrualCycleResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return MenstrualCycleResponse(
      success: json["success"],
      message: json["message"],
      data: MenstrualCycle.fromJson(json["data"]),
    );
  }
}