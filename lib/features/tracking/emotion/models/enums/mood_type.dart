enum MoodType {
  happy,
  calm,
  motivated,
  tired,
  sad,
  stressed,
  anxious,
  irritable;

  String get apiValue {
    switch (this) {
      case MoodType.happy:
        return "HAPPY";
      case MoodType.calm:
        return "CALM";
      case MoodType.motivated:
        return "MOTIVATED";
      case MoodType.tired:
        return "TIRED";
      case MoodType.sad:
        return "SAD";
      case MoodType.stressed:
        return "STRESSED";
      case MoodType.anxious:
        return "ANXIOUS";
      case MoodType.irritable:
        return "IRRITABLE";
    }
  }

  static MoodType fromJson(String value) {
    return MoodType.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }

  String get label {
    switch (this) {
      case MoodType.happy:
        return "😊 Heureuse";
      case MoodType.calm:
        return "😌 Calme";
      case MoodType.motivated:
        return "💪 Motivée";
      case MoodType.tired:
        return "😴 Fatiguée";
      case MoodType.sad:
        return "😢 Triste";
      case MoodType.stressed:
        return "😣 Stressée";
      case MoodType.anxious:
        return "😰 Anxieuse";
      case MoodType.irritable:
        return "😤 Irritable";
    }
  }
}