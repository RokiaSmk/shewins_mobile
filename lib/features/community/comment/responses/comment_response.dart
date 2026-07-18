import '../models/comment.dart';

class CommentResponse {
  final bool success;

  final String message;

  final Comment data;

  const CommentResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CommentResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return CommentResponse(
      success: json["success"],
      message: json["message"],
      data: Comment.fromJson(
        json["data"],
      ),
    );
  }
}