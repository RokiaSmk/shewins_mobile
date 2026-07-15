import 'auth_user.dart';

class MeResponse {
  final bool success;
  final String message;
  final AuthUser data;

  const MeResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory MeResponse.fromJson(Map<String, dynamic> json) {
    return MeResponse(
      success: json["success"],
      message: json["message"],
      data: AuthUser.fromJson(json["data"]),
    );
  }
}