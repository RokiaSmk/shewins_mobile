enum SymptomIntensity {
  mild,
  moderate,
  severe;

  String get apiValue {
    switch (this) {
      case SymptomIntensity.mild:
        return "MILD";
      case SymptomIntensity.moderate:
        return "MODERATE";
      case SymptomIntensity.severe:
        return "SEVERE";
    }
  }

  static SymptomIntensity fromJson(String value) {
    return SymptomIntensity.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}