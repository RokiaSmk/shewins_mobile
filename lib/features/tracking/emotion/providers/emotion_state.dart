import '../models/emotion_journal.dart';

class EmotionState {
  final bool isLoading;
  final List<EmotionJournal> emotions;
  final String? error;

  const EmotionState({
    this.isLoading = false,
    this.emotions = const [],
    this.error,
  });

  EmotionState copyWith({
    bool? isLoading,
    List<EmotionJournal>? emotions,
    String? error,
  }) {
    return EmotionState(
      isLoading: isLoading ?? this.isLoading,
      emotions: emotions ?? this.emotions,
      error: error,
    );
  }
}