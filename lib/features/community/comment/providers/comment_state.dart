import '../models/comment.dart';

class CommentState {
  final bool isLoading;

  final List<Comment> comments;

  final String? error;

  const CommentState({
    this.isLoading = false,
    this.comments = const [],
    this.error,
  });

  CommentState copyWith({
    bool? isLoading,
    List<Comment>? comments,
    String? error,
  }) {
    return CommentState(
      isLoading:
          isLoading ?? this.isLoading,
      comments:
          comments ?? this.comments,
      error: error,
    );
  }
}