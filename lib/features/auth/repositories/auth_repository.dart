import '../models/login_request.dart';
import '../models/login_response.dart';
import '../services/auth_service.dart';
import '../models/register_request.dart';
import '../models/me_response.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<LoginResponse> login(LoginRequest request) async {
    return await _authService.login(request);
  }
  Future<LoginResponse> register(RegisterRequest request) async {
  return await _authService.register(request);
  }
Future<MeResponse> getCurrentUser() async {
  return await _authService.getCurrentUser();
  }
  Future<void> deleteAccount() async {
  await _authService.deleteAccount();
}
}