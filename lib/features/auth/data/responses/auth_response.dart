import 'package:arcadia_rpg/core/network/http_client.dart';
import 'package:arcadia_rpg/features/auth/domain/entities/auth.dart';

import '../../domain/entities/user.dart';

class SignInResponse extends HttpResponse<Auth?> {
  final String token;
  final String userId;
  final String userName;
  final String email;

  SignInResponse({
    required this.token,
    required this.userId,
    required this.userName,
    required this.email,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      userId: json['id'],
      userName: json['username'],
      email: json['email'],
      token: json['token'],
    );
  }

  @override
  toResponse() {
    return Auth(
      token: token,
      user: User(id: userId, username: userName, email: email),
    );
  }
}

class SignUpResponse extends HttpResponse<Auth?> {
  final String message;
  final String token;
  final String userId;
  final String userName;
  final String email;

  SignUpResponse({
    required this.message,
    required this.token,
    required this.userId,
    required this.userName,
    required this.email,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      userId: json['id'],
      userName: json['username'],
      email: json['email'],
      token: json['token'],
      message: json['message'],
    );
  }

  @override
  toResponse() {
    return Auth(
      token: token,
      user: User(id: userId, username: userName, email: email),
    );
  }
}

class ForgotPasswordResponse extends HttpResponse {
  final String message;

  ForgotPasswordResponse({required this.message});

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(message: json['message']);
  }

  @override
  toResponse() {
    return null;
  }
}

class ResetPasswordResponse extends HttpResponse {
  final String message;

  ResetPasswordResponse({required this.message});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(message: json['message']);
  }

  @override
  toResponse() {
    return null;
  }
}
