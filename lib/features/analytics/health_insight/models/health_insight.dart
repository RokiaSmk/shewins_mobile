class HealthInsight {
  final String id;

  final int globalHealthScore;

  final String riskLevel;

  final String cycleInsight;

  final String symptomInsight;

  final String nutritionInsight;

  final String emotionInsight;

  final String generalRecommendation;

  final DateTime createdAt;

  final DateTime updatedAt;

  const HealthInsight({
    required this.id,
    required this.globalHealthScore,
    required this.riskLevel,
    required this.cycleInsight,
    required this.symptomInsight,
    required this.nutritionInsight,
    required this.emotionInsight,
    required this.generalRecommendation,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HealthInsight.fromJson(
    Map<String, dynamic> json,
  ) {
    return HealthInsight(
      id: json["id"],

      globalHealthScore:
          json["globalHealthScore"],

      riskLevel:
          json["riskLevel"],

      cycleInsight:
          json["cycleInsight"],

      symptomInsight:
          json["symptomInsight"],

      nutritionInsight:
          json["nutritionInsight"],

      emotionInsight:
          json["emotionInsight"],

      generalRecommendation:
          json["generalRecommendation"],

      createdAt: DateTime.parse(
        json["createdAt"],
      ),

      updatedAt: DateTime.parse(
        json["updatedAt"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "globalHealthScore": globalHealthScore,
      "riskLevel": riskLevel,
      "cycleInsight": cycleInsight,
      "symptomInsight": symptomInsight,
      "nutritionInsight": nutritionInsight,
      "emotionInsight": emotionInsight,
      "generalRecommendation":
          generalRecommendation,
      "createdAt":
          createdAt.toIso8601String(),
      "updatedAt":
          updatedAt.toIso8601String(),
    };
  }
}