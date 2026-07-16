import '../models/cycle_profile.dart';

class CycleProfileResponse {
  final bool success;
  final String message;
  final CycleProfile data;

  const CycleProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CycleProfileResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CycleProfileResponse(
      success: json["success"],
      message: json["message"],
      data: CycleProfile.fromJson(json["data"]),
    );
  }
}