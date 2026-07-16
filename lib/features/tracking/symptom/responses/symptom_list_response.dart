import '../models/symptom.dart';

class SymptomListResponse {
  final bool success;
  final String message;
  final List<Symptom> data;

  const SymptomListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SymptomListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SymptomListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map((e) => Symptom.fromJson(e))
          .toList(),
    );
  }
}