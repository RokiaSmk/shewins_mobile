import '../../../core/network/api_constants.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../../../core/network/api_client.dart';
import '../models/register_request.dart';
import '../models/me_response.dart';

class AuthService {
  Future<LoginResponse> login(LoginRequest request) async {
    final response = await ApiClient.dio.post(
      ApiConstants.login,
      data: request.toJson(),
    );

    return LoginResponse.fromJson(response.data);
  }
  Future<LoginResponse> register(RegisterRequest request) async {
  final response = await ApiClient.dio.post(
    ApiConstants.register,
    data: request.toJson(),
  );

  return LoginResponse.fromJson(response.data);
  }
Future<MeResponse> getCurrentUser() async {
  final response = await ApiClient.dio.get(
    ApiConstants.me,
  );

  return MeResponse.fromJson(response.data);
  }
  Future<void> deleteAccount() async {
  await ApiClient.dio.delete(
    ApiConstants.deleteAccount,
  );
}
}
