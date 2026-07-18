class UpdateCommentRequest {
  final String content;

  const UpdateCommentRequest({
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      "content": content,
    };
  }
}