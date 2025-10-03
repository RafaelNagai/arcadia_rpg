import 'package:arcadia_rpg/core/route/route_guard.dart';
import 'package:arcadia_rpg/core/route/route_name.dart';
import 'package:arcadia_rpg/features/auth/presentation/forgot_password_page.dart';
import 'package:arcadia_rpg/features/auth/presentation/reset_password_page.dart';
import 'package:arcadia_rpg/features/auth/presentation/signin_page.dart';
import 'package:arcadia_rpg/features/auth/presentation/signup_page.dart';
import 'package:arcadia_rpg/features/character/presentation/character_page.dart';
import 'package:arcadia_rpg/features/home/presentation/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    initialLocation: RouteName.home.path(),
    routes: [
      GoRoute(
        path: RouteName.home.path(),
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: RouteName.signin.path(),
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: RouteName.signup.path(),
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: RouteName.forgotPassword.path(),
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: "${RouteName.resetPassword.path()}/:token",
        builder: (context, state) {
          final token = state.pathParameters['token'];
          return ResetPasswordPage(token: token ?? "");
        },
      ),
      GoRoute(
        path: RouteName.character.path(),
        builder: (context, state) => CharacterPage(),
      ),
    ],
    redirect: (context, state) {
      return GoRouterGuard.instance.routeGuard(context, state, ref);
    },
  ),
);
