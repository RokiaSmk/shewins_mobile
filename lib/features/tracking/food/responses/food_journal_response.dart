import '../models/food_journal.dart';

class FoodJournalResponse {
  final bool success;
  final String message;
  final FoodJournal data;

  const FoodJournalResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FoodJournalResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodJournalResponse(
      success: json["success"],
      message: json["message"],
      data: FoodJournal.fromJson(
        json["data"],
      ),
    );
  }
}