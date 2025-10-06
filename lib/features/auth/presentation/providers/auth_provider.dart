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

final authProvider = AsyncNotifierProvider<AuthNotifier, Auth?>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<Auth?> {
  @override
  Future<Auth?> build() async {
    final repo = ref.read(authRepositoryProvider);
    return await repo.loadAuth();
  }

  signIn(String userName, String password) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    try {
      final auth = await authRepository.signIn(
        email: userName,
        password: password,
      );
      if (auth.token != null) {
        await authRepository.saveAuth(auth);
        state = AsyncData(auth);
        ref.read(routeProvider).go(RouteName.character.path());
      } else {
        state = AsyncError('Invalid credentials', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  signUp(String userName, String email, String password) async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);
    try {
      final auth = await authRepository.signUp(
        username: userName,
        email: email,
        password: password,
      );
      if (auth.token != null) {
        await authRepository.saveAuth(auth);
        state = AsyncData(auth);
        ref.read(routeProvider).go(RouteName.character.path());
      } else {
        state = AsyncError('Failed to sign up', StackTrace.current);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  signOut() {
    final authRepository = ref.read(authRepositoryProvider);
    authRepository.clearAuth();
    state = const AsyncData(null);
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
