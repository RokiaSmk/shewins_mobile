import 'enums/meal_type.dart';

class FoodJournal {
  final String id;
  final String cycleId;
  final MealType mealType;
  final List<String> foodIds;
  final DateTime mealDate;

  const FoodJournal({
    required this.id,
    required this.cycleId,
    required this.mealType,
    required this.foodIds,
    required this.mealDate,
  });

  factory FoodJournal.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodJournal(
      id: json["id"],
      cycleId: json["cycleId"],
      mealType: MealType.fromJson(
        json["mealType"],
      ),
      foodIds: List<String>.from(
        json["foodIds"],
      ),
      mealDate: DateTime.parse(
        json["mealDate"],
      ),
    );
  }
}