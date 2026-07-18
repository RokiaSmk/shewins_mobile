import 'enums/publication_category.dart';

class Publication {
  final String id;

  final String authorId;

  final String authorFirstName;

  final String authorLastName;

  final String title;

  final String content;

  final PublicationCategory category;

  final bool commentsEnabled;

  final int reactionCount;

  final int commentCount;

  final DateTime createdAt;

  final DateTime updatedAt;

  const Publication({
    required this.id,
    required this.authorId,
    required this.authorFirstName,
    required this.authorLastName,
    required this.title,
    required this.content,
    required this.category,
    required this.commentsEnabled,
    required this.reactionCount,
    required this.commentCount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Publication.fromJson(
    Map<String, dynamic> json,
  ) {
    return Publication(
      id: json["id"],

      authorId: json["authorId"],

      authorFirstName:
          json["authorFirstName"],

      authorLastName:
          json["authorLastName"],

      title: json["title"],

      content: json["content"],

      category:
          PublicationCategory.fromJson(
        json["category"],
      ),

      commentsEnabled:
          json["commentsEnabled"],

      reactionCount:
          json["reactionCount"],

      commentCount:
          json["commentCount"],

      createdAt: DateTime.parse(
        json["createdAt"],
      ),

      updatedAt: DateTime.parse(
        json["updatedAt"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,

      "authorId": authorId,

      "authorFirstName":
          authorFirstName,

      "authorLastName":
          authorLastName,

      "title": title,

      "content": content,

      "category":
          category.apiValue,

      "commentsEnabled":
          commentsEnabled,

      "reactionCount":
          reactionCount,

      "commentCount":
          commentCount,

      "createdAt":
          createdAt.toIso8601String(),

      "updatedAt":
          updatedAt.toIso8601String(),
    };
  }
}