enum MealType {
  breakfast,
  lunch,
  dinner,
  snack;

  String get apiValue {
    switch (this) {
      case MealType.breakfast:
        return "BREAKFAST";
      case MealType.lunch:
        return "LUNCH";
      case MealType.dinner:
        return "DINNER";
      case MealType.snack:
        return "SNACK";
    }
  }

  static MealType fromJson(String value) {
    return MealType.values.firstWhere(
      (e) => e.apiValue == value,
    );
  }

  String get label {
    switch (this) {
      case MealType.breakfast:
        return "Petit-déjeuner";
      case MealType.lunch:
        return "Déjeuner";
      case MealType.dinner:
        return "Dîner";
      case MealType.snack:
        return "Collation";
    }
  }
}