class Prediction {
  final String id;

  final DateTime predictedPeriodStart;
  final DateTime predictedPeriodEnd;

  final DateTime predictedOvulationDate;

  final DateTime fertileWindowStart;
  final DateTime fertileWindowEnd;

  final int confidenceScore;

  final double averageCycleLength;
  final double cycleVariability;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Prediction({
    required this.id,
    required this.predictedPeriodStart,
    required this.predictedPeriodEnd,
    required this.predictedOvulationDate,
    required this.fertileWindowStart,
    required this.fertileWindowEnd,
    required this.confidenceScore,
    required this.averageCycleLength,
    required this.cycleVariability,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Prediction.fromJson(
    Map<String, dynamic> json,
  ) {
    return Prediction(
      id: json["id"],

      predictedPeriodStart:
          DateTime.parse(json["predictedPeriodStart"]),

      predictedPeriodEnd:
          DateTime.parse(json["predictedPeriodEnd"]),

      predictedOvulationDate:
          DateTime.parse(json["predictedOvulationDate"]),

      fertileWindowStart:
          DateTime.parse(json["fertileWindowStart"]),

      fertileWindowEnd:
          DateTime.parse(json["fertileWindowEnd"]),

      confidenceScore:
          json["confidenceScore"],

      averageCycleLength:
          (json["averageCycleLength"] as num).toDouble(),

      cycleVariability:
          (json["cycleVariability"] as num).toDouble(),

      createdAt:
          DateTime.parse(json["createdAt"]),

      updatedAt:
          DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "predictedPeriodStart":
          predictedPeriodStart.toIso8601String(),

      "predictedPeriodEnd":
          predictedPeriodEnd.toIso8601String(),

      "predictedOvulationDate":
          predictedOvulationDate.toIso8601String(),

      "fertileWindowStart":
          fertileWindowStart.toIso8601String(),

      "fertileWindowEnd":
          fertileWindowEnd.toIso8601String(),

      "confidenceScore":
          confidenceScore,

      "averageCycleLength":
          averageCycleLength,

      "cycleVariability":
          cycleVariability,

      "createdAt":
          createdAt.toIso8601String(),

      "updatedAt":
          updatedAt.toIso8601String(),
    };
  }
}