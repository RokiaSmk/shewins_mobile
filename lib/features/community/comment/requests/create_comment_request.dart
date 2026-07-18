class CreateCommentRequest {
  final String content;

  const CreateCommentRequest({
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      "content": content,
    };
  }
}