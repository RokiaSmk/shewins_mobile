import '../models/reaction.dart';

class ReactionState {
  final bool isLoading;

  final Reaction? reaction;

  final String? error;

  const ReactionState({
    this.isLoading = false,
    this.reaction,
    this.error,
  });

  ReactionState copyWith({
    bool? isLoading,
    Reaction? reaction,
    String? error,
  }) {
    return ReactionState(
      isLoading: isLoading ?? this.isLoading,
      reaction: reaction ?? this.reaction,
      error: error,
    );
  }
}