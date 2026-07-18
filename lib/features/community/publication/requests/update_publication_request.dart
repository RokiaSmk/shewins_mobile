import '../models/enums/publication_category.dart';

class UpdatePublicationRequest {
  final String title;

  final String content;

  final PublicationCategory category;

  final bool commentsEnabled;

  const UpdatePublicationRequest({
    required this.title,
    required this.content,
    required this.category,
    required this.commentsEnabled,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "category": category.apiValue,
      "commentsEnabled": commentsEnabled,
    };
  }
}