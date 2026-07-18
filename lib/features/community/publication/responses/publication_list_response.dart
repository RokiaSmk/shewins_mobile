import '../models/publication.dart';

class PublicationListResponse {
  final bool success;

  final String message;

  final List<Publication> data;

  const PublicationListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PublicationListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return PublicationListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map(
            (e) => Publication.fromJson(e),
          )
          .toList(),
    );
  }
}