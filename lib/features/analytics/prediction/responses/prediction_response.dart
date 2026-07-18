import '../models/prediction.dart';

class PredictionResponse {
  final bool success;
  final String message;
  final Prediction data;

  const PredictionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PredictionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return PredictionResponse(
      success: json["success"],
      message: json["message"],
      data: Prediction.fromJson(
        json["data"],
      ),
    );
  }
}