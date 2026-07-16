import '../models/food_journal.dart';

class FoodState {
  final bool isLoading;
  final List<FoodJournal> journals;
  final String? error;

  const FoodState({
    this.isLoading = false,
    this.journals = const [],
    this.error,
  });

  FoodState copyWith({
    bool? isLoading,
    List<FoodJournal>? journals,
    String? error,
  }) {
    return FoodState(
      isLoading: isLoading ?? this.isLoading,
      journals: journals ?? this.journals,
      error: error,
    );
  }
}