import '../models/emotion_journal.dart';

class EmotionResponse {
  final bool success;
  final String message;
  final EmotionJournal data;

  const EmotionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory EmotionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EmotionResponse(
      success: json["success"],
      message: json["message"],
      data: EmotionJournal.fromJson(
        json["data"],
      ),
    );
  }
}