import '../models/enums/mood_type.dart';

class UpdateEmotionRequest {
  final MoodType mood;
  final String? note;
  final DateTime emotionDate;

  const UpdateEmotionRequest({
    required this.mood,
    this.note,
    required this.emotionDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "mood": mood.apiValue,
      "note": note,
      "emotionDate":
          emotionDate.toIso8601String().split("T").first,
    };
  }
}