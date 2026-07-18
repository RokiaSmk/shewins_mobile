import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/register_request.dart';
import '../repositories/auth_repository.dart';
import '../../../core/storage/token_storage.dart';
import '../models/auth_user.dart';

final authProvider =
    NotifierProvider<AuthNotifier, bool>(AuthNotifier.new);

class AuthNotifier extends Notifier<bool> {
  final AuthRepository _repository = AuthRepository();

  @override
  bool build() {
    return false;
  }

  Future<AuthUser?> login({
  required String email,
  required String password,
}) async {
  state = true;

  try {
    final response = await _repository.login(
      LoginRequest(
        email: email,
        password: password,
      ),
    );

    if (response.success) {
      await TokenStorage.saveToken(
        response.data.token,
      );

      return response.data.member;
    }

    return null;
  } catch (e) {
    debugPrint("Erreur Login : $e");
    return null;
  } finally {
    state = false;
  }
}

  Future<LoginResponse?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    state = true;

    try {
      final response = await _repository.register(
        RegisterRequest(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );

      return response;
    } catch (e) {
      debugPrint("Erreur Register : $e");
      return null;
    } finally {
      state = false;
    }
  }
  Future<AuthUser?> checkAuthentication() async {
    try {
      final token = await TokenStorage.getToken();

      if (token == null || token.isEmpty) {
        return null;
      }

      final response = await _repository.getCurrentUser();

      return response.data;
    } catch (e) {
      await TokenStorage.deleteToken();

      debugPrint("Erreur Auto Login : $e");

      return null;
    }
  }
  Future<void> logout() async {
    await TokenStorage.deleteToken();
  }
  Future<bool> deleteAccount() async {
  state = true;

  try {
    await _repository.deleteAccount();

    await TokenStorage.deleteToken();

    return true;
  } catch (e) {
    debugPrint("Erreur suppression du compte : $e");
    return false;
  } finally {
    state = false;
  }
}
}