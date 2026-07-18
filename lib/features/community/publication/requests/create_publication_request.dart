import '../models/enums/publication_category.dart';

class CreatePublicationRequest {
  final String title;

  final String content;

  final PublicationCategory category;

  const CreatePublicationRequest({
    required this.title,
    required this.content,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "content": content,
      "category": category.apiValue,
    };
  }
}