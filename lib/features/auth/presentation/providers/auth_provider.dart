import 'package:arcadia_rpg/core/network/dio_client.dart';
import 'package:arcadia_rpg/core/route/route_manager.dart';
import 'package:arcadia_rpg/core/route/route_name.dart';
import 'package:arcadia_rpg/features/auth/data/repositories/auth_repository.dart';
import 'package:arcadia_rpg/features/auth/domain/entities/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dioNotifier = ref.read(dioProvider);
  return AuthRepositoryImpl(dioNotifier);
});

final authProvider = NotifierProvider<AuthNotifier, Auth>(AuthNotifier.new);

class AuthNotifier extends Notifier<Auth> {
  @override
  Auth build() => Auth();

  signIn(String userName, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    final auth = await authRepository.signIn(
      email: userName,
      password: password,
    );
    if (auth.token != null) {
      state = auth;
      ref.read(routeProvider).go(RouteName.character.path());
    }
  }

  signUp(String userName, String email, String password) async {
    final authRepository = ref.read(authRepositoryProvider);
    final auth = await authRepository.signUp(
      username: userName,
      email: email,
      password: password,
    );
    if (auth.token != null) {
      state = auth;
      ref.read(routeProvider).go(RouteName.character.path());
    }
  }

  signOut() {
    state = Auth();
    ref.read(routeProvider).go(RouteName.home.path());
  }

  forgetPassword(String email) async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.forgotPassword(email: email);
  }

  resetPassword(String token, String newPassword) async {
    final authRepository = ref.read(authRepositoryProvider);
    await authRepository.resetPassword(token: token, newPassword: newPassword);
  }
}
