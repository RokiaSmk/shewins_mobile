enum FlowIntensity {
  light,
  medium,
  heavy;

  String get apiValue {
    switch (this) {
      case FlowIntensity.light:
        return "LIGHT";
      case FlowIntensity.medium:
        return "MEDIUM";
      case FlowIntensity.heavy:
        return "HEAVY";
    }
  }

  static FlowIntensity fromJson(String value) {
    return FlowIntensity.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}