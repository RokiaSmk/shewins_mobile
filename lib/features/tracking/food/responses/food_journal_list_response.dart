import '../models/food_journal.dart';

class FoodJournalListResponse {
  final bool success;
  final String message;
  final List<FoodJournal> data;

  const FoodJournalListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory FoodJournalListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return FoodJournalListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map((e) => FoodJournal.fromJson(e))
          .toList(),
    );
  }
}