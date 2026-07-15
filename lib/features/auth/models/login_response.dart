import 'auth_user.dart';

class LoginResponse {
  final bool success;
  final String message;
  final LoginData data;

  const LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json["success"],
      message: json["message"],
      data: LoginData.fromJson(json["data"]),
    );
  }
}

class LoginData {
  final String token;
  final String tokenType;
  final AuthUser member;

  const LoginData({
    required this.token,
    required this.tokenType,
    required this.member,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      token: json["token"],
      tokenType: json["tokenType"],
      member: AuthUser.fromJson(json["membre"]),
    );
  }
}