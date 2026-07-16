import '../models/emotion_journal.dart';

class EmotionListResponse {
  final bool success;
  final String message;
  final List<EmotionJournal> data;

  const EmotionListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory EmotionListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return EmotionListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map(
            (e) =>
                EmotionJournal.fromJson(e),
          )
          .toList(),
    );
  }
}