enum RecommendationLevel {
  recommended,
  moderate,
  limit,
  avoid;

  String get apiValue {
    switch (this) {
      case RecommendationLevel.recommended:
        return "RECOMMENDED";
      case RecommendationLevel.moderate:
        return "MODERATE";
      case RecommendationLevel.limit:
        return "LIMIT";
      case RecommendationLevel.avoid:
        return "AVOID";
    }
  }

  static RecommendationLevel fromJson(String value) {
    return RecommendationLevel.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }

  String get label {
    switch (this) {
      case RecommendationLevel.recommended:
        return "Recommandé";
      case RecommendationLevel.moderate:
        return "À modérer";
      case RecommendationLevel.limit:
        return "À limiter";
      case RecommendationLevel.avoid:
        return "À éviter";
    }
  }
}