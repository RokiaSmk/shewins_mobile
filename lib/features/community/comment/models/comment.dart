class Comment {
  final String id;
  final String authorId;
  final String authorFirstName;
  final String authorLastName;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Comment({
    required this.id,
    required this.authorId,
    required this.authorFirstName,
    required this.authorLastName,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comment.fromJson(
    Map<String, dynamic> json,
  ) {
    return Comment(
      id: json["id"],
      authorId: json["authorId"],
      authorFirstName: json["authorFirstName"],
      authorLastName: json["authorLastName"],
      content: json["content"],
      createdAt: DateTime.parse(
        json["createdAt"],
      ),
      updatedAt: DateTime.parse(
        json["updatedAt"],
      ),
    );
  }
}