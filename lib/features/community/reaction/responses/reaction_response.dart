import '../models/reaction.dart';

class ReactionResponse {
  final bool success;

  final String message;

  final Reaction data;

  const ReactionResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ReactionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ReactionResponse(
      success: json["success"],
      message: json["message"],
      data: Reaction.fromJson(
        json["data"],
      ),
    );
  }
}