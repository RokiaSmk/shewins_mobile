import '../models/comment.dart';

class CommentListResponse {
  final bool success;

  final String message;

  final List<Comment> data;

  const CommentListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CommentListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CommentListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map(
            (e) => Comment.fromJson(e),
          )
          .toList(),
    );
  }
}