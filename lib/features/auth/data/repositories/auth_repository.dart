import 'dart:convert';

import 'package:arcadia_rpg/core/network/http_client.dart';
import 'package:arcadia_rpg/features/auth/data/responses/auth_response.dart';
import 'package:arcadia_rpg/features/auth/domain/entities/auth.dart';
import 'package:arcadia_rpg/features/auth/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRepository {
  Future<Auth> signIn({required String email, required String password});

  Future<Auth> signUp({
    required String username,
    required String email,
    required String password,
  });

  Future<void> forgotPassword({required String email});

  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });

  Future<Auth?> loadAuth();
  Future<void> saveAuth(Auth auth);
  Future<void> clearAuth();
}

class AuthRepositoryImpl implements AuthRepository {
  static const _authKey = 'auth_data';
  final HttpClient _httpClient;

  AuthRepositoryImpl(this._httpClient);

  @override
  Future<Auth> signIn({required String email, required String password}) async {
    final response = await _httpClient.post(
      '/auth/signin',
      data: {'email': email, 'password': password},
      onConvert: (response) {
        return SignInResponse.fromJson(response!);
      },
    );
    return response.toResponse();
  }

  @override
  Future<Auth> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final result = await _httpClient.post(
      '/auth/signup',
      data: {'username': username, 'email': email, 'password': password},
      onConvert: (response) => SignUpResponse.fromJson(response!),
    );
    return result.toResponse();
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    await _httpClient.post(
      '/auth/forgot-password',
      data: {'email': email},
      onConvert: (json) => ForgotPasswordResponse.fromJson(json!),
    );
  }

  @override
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    await _httpClient.post(
      '/auth/reset-password/$token',
      data: {'newPassword': newPassword},
      onConvert: (json) => ResetPasswordResponse.fromJson(json!),
    );
  }

  @override
  Future<Auth?> loadAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_authKey);
    if (jsonStr == null) return null;

    final data = jsonDecode(jsonStr);
    final user = data['user'] != null ? User.fromJson(data['user']) : null;

    return Auth(token: data['token'], user: user);
  }

  @override
  Future<void> saveAuth(Auth auth) async {
    final prefs = await SharedPreferences.getInstance();
    final data = {'token': auth.token, 'user': auth.user?.toJson()};
    await prefs.setString(_authKey, jsonEncode(data));
  }

  @override
  Future<void> clearAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authKey);
  }
}
