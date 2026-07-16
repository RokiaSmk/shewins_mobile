import '../models/enums/meal_type.dart';

class UpdateFoodJournalRequest {
  final MealType mealType;
  final List<String> foodIds;
  final DateTime mealDate;

  const UpdateFoodJournalRequest({
    required this.mealType,
    required this.foodIds,
    required this.mealDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "mealType": mealType.apiValue,
      "foodIds": foodIds,
      "mealDate": mealDate.toIso8601String().split("T").first,
    };
  }
}