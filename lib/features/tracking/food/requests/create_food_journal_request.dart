import '../models/enums/meal_type.dart';

class CreateFoodJournalRequest {
  final String cycleId;
  final MealType mealType;
  final List<String> foodIds;
  final DateTime mealDate;

  const CreateFoodJournalRequest({
    required this.cycleId,
    required this.mealType,
    required this.foodIds,
    required this.mealDate,
  });

  Map<String, dynamic> toJson() {
    return {
      "cycleId": cycleId,
      "mealType": mealType.apiValue,
      "foodIds": foodIds,
      "mealDate": mealDate.toIso8601String().split("T").first,
    };
  }
}