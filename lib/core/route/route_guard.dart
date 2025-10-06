import 'dart:async';
import 'package:arcadia_rpg/core/route/route_name.dart';
import 'package:arcadia_rpg/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GoGuard {
  final List<String> paths;
  final String redirectTo;
  final FutureOr<bool> Function(Ref ref) onValidate;

  GoGuard({
    required this.paths,
    required this.redirectTo,
    required this.onValidate,
  });
}

class GoRouterGuard {
  GoRouterGuard._();

  static final GoRouterGuard instance = GoRouterGuard._();

  final guards = [
    GoGuard(
      paths: [RouteName.signin.path(), RouteName.signup.path()],
      redirectTo: RouteName.home.path(),
      onValidate: (ref) {
        return ref.read(authProvider).value?.token == null;
      },
    ),
    GoGuard(
      paths: [RouteName.character.path()],
      redirectTo: RouteName.signin.path(),
      onValidate: (ref) {
        return ref.read(authProvider).value?.token != null;
      },
    ),
  ];

  FutureOr<String?> routeGuard(
    BuildContext context,
    GoRouterState state,
    Ref ref,
  ) async {
    for (var guard in guards) {
      if (guard.paths.any((element) => state.fullPath!.contains(element))) {
        if (!(await guard.onValidate(ref))) {
          return guard.redirectTo;
        }
      }
    }
    return null;
  }
}
