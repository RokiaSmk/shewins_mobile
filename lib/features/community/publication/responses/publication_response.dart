import '../models/publication.dart';

class PublicationResponse {
  final bool success;

  final String message;

  final Publication data;

  const PublicationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory PublicationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return PublicationResponse(
      success: json["success"],
      message: json["message"],
      data: Publication.fromJson(
        json["data"],
      ),
    );
  }
}