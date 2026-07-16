import '../models/symptom.dart';

class SymptomResponse {
  final bool success;
  final String message;
  final Symptom data;

  const SymptomResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SymptomResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SymptomResponse(
      success: json["success"],
      message: json["message"],
      data: Symptom.fromJson(json["data"]),
    );
  }
}