class Statistics {
  final String id;

  // Cycle
  final double averageCycleLength;
  final double averagePeriodLength;
  final double cycleVariability;
  final double cycleRegularityScore;
  final int shortestCycle;
  final int longestCycle;
  final int totalCycles;

  // Symptômes
  final String mostFrequentSymptom;
  final double averageSymptomIntensity;
  final int pelvicPainCount;
  final int bloatingCount;
  final int fatigueCount;
  final int acneCount;
  final int migraineCount;
  final int nauseaCount;
  final int spottingCount;
  final int backPainCount;
  final int breastPainCount;
  final int totalSymptoms;

  // Emotions
  final String dominantMood;
  final int happyDays;
  final int stressedDays;
  final int anxiousDays;
  final int sadDays;
  final int angryDays;
  final int tiredDays;
  final int totalEmotionEntries;

  // Nutrition
  final String dominantMealType;
  final int breakfastCount;
  final int lunchCount;
  final int dinnerCount;
  final int snackCount;
  final int totalMeals;

  final DateTime createdAt;
  final DateTime updatedAt;

  const Statistics({
    required this.id,

    required this.averageCycleLength,
    required this.averagePeriodLength,
    required this.cycleVariability,
    required this.cycleRegularityScore,
    required this.shortestCycle,
    required this.longestCycle,
    required this.totalCycles,

    required this.mostFrequentSymptom,
    required this.averageSymptomIntensity,
    required this.pelvicPainCount,
    required this.bloatingCount,
    required this.fatigueCount,
    required this.acneCount,
    required this.migraineCount,
    required this.nauseaCount,
    required this.spottingCount,
    required this.backPainCount,
    required this.breastPainCount,
    required this.totalSymptoms,

    required this.dominantMood,
    required this.happyDays,
    required this.stressedDays,
    required this.anxiousDays,
    required this.sadDays,
    required this.angryDays,
    required this.tiredDays,
    required this.totalEmotionEntries,

    required this.dominantMealType,
    required this.breakfastCount,
    required this.lunchCount,
    required this.dinnerCount,
    required this.snackCount,
    required this.totalMeals,

    required this.createdAt,
    required this.updatedAt,
  });

  factory Statistics.fromJson(
    Map<String, dynamic> json,
  ) {
    return Statistics(
      id: json["id"],

      averageCycleLength:
          (json["averageCycleLength"] as num).toDouble(),

      averagePeriodLength:
          (json["averagePeriodLength"] as num).toDouble(),

      cycleVariability:
          (json["cycleVariability"] as num).toDouble(),

      cycleRegularityScore:
          (json["cycleRegularityScore"] as num).toDouble(),

      shortestCycle: json["shortestCycle"],

      longestCycle: json["longestCycle"],

      totalCycles: json["totalCycles"],

      mostFrequentSymptom:
          json["mostFrequentSymptom"],

      averageSymptomIntensity:
          (json["averageSymptomIntensity"] as num).toDouble(),

      pelvicPainCount:
          json["pelvicPainCount"],

      bloatingCount:
          json["bloatingCount"],

      fatigueCount:
          json["fatigueCount"],

      acneCount:
          json["acneCount"],

      migraineCount:
          json["migraineCount"],

      nauseaCount:
          json["nauseaCount"],

      spottingCount:
          json["spottingCount"],

      backPainCount:
          json["backPainCount"],

      breastPainCount:
          json["breastPainCount"],

      totalSymptoms:
          json["totalSymptoms"],

      dominantMood:
          json["dominantMood"],

      happyDays:
          json["happyDays"],

      stressedDays:
          json["stressedDays"],

      anxiousDays:
          json["anxiousDays"],

      sadDays:
          json["sadDays"],

      angryDays:
          json["angryDays"],

      tiredDays:
          json["tiredDays"],

      totalEmotionEntries:
          json["totalEmotionEntries"],

      dominantMealType:
          json["dominantMealType"],

      breakfastCount:
          json["breakfastCount"],

      lunchCount:
          json["lunchCount"],

      dinnerCount:
          json["dinnerCount"],

      snackCount:
          json["snackCount"],

      totalMeals:
          json["totalMeals"],

      createdAt:
          DateTime.parse(json["createdAt"]),

      updatedAt:
          DateTime.parse(json["updatedAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,

      "averageCycleLength": averageCycleLength,
      "averagePeriodLength": averagePeriodLength,
      "cycleVariability": cycleVariability,
      "cycleRegularityScore": cycleRegularityScore,
      "shortestCycle": shortestCycle,
      "longestCycle": longestCycle,
      "totalCycles": totalCycles,

      "mostFrequentSymptom": mostFrequentSymptom,
      "averageSymptomIntensity": averageSymptomIntensity,
      "pelvicPainCount": pelvicPainCount,
      "bloatingCount": bloatingCount,
      "fatigueCount": fatigueCount,
      "acneCount": acneCount,
      "migraineCount": migraineCount,
      "nauseaCount": nauseaCount,
      "spottingCount": spottingCount,
      "backPainCount": backPainCount,
      "breastPainCount": breastPainCount,
      "totalSymptoms": totalSymptoms,

      "dominantMood": dominantMood,
      "happyDays": happyDays,
      "stressedDays": stressedDays,
      "anxiousDays": anxiousDays,
      "sadDays": sadDays,
      "angryDays": angryDays,
      "tiredDays": tiredDays,
      "totalEmotionEntries": totalEmotionEntries,

      "dominantMealType": dominantMealType,
      "breakfastCount": breakfastCount,
      "lunchCount": lunchCount,
      "dinnerCount": dinnerCount,
      "snackCount": snackCount,
      "totalMeals": totalMeals,

      "createdAt": createdAt.toIso8601String(),
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}