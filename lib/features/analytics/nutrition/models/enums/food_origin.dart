enum FoodOrigin {
  african,
  international,
  both;

  String get apiValue {
    switch (this) {
      case FoodOrigin.african:
        return "AFRICAN";
      case FoodOrigin.international:
        return "INTERNATIONAL";
      case FoodOrigin.both:
        return "BOTH";
    }
  }

  static FoodOrigin fromJson(String value) {
    return FoodOrigin.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }
}