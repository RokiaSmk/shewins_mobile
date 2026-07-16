import 'enums/mood_type.dart';

class EmotionJournal {
  final String id;
  final String cycleId;
  final MoodType mood;
  final String? note;
  final DateTime emotionDate;

  const EmotionJournal({
    required this.id,
    required this.cycleId,
    required this.mood,
    this.note,
    required this.emotionDate,
  });

  factory EmotionJournal.fromJson(
    Map<String, dynamic> json,
  ) {
    return EmotionJournal(
      id: json["id"],
      cycleId: json["cycleId"],
      mood: MoodType.fromJson(
        json["mood"],
      ),
      note: json["note"],
      emotionDate: DateTime.parse(
        json["emotionDate"],
      ),
    );
  }
}