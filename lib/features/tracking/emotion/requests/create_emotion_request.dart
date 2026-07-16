import '../models/enums/mood_type.dart';

class CreateEmotionRequest {
  final String cycleId;
  final MoodType mood;
  final String? note;
  final DateTime emotionDate;

  const CreateEmotionRequest({
    required this.cycleId,
    required this.mood,
    this.note,
    required this.emotionDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "cycleId": cycleId,
      "mood": mood.apiValue,
      "note": note,
      "emotionDate":
          emotionDate.toIso8601String().split("T").first,
    };
  }
}