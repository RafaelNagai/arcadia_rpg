import 'package:arcadia_rpg/core/route/route_guard.dart';
import 'package:arcadia_rpg/core/route/route_name.dart';
import 'package:arcadia_rpg/features/auth/presentation/signin_page.dart';
import 'package:arcadia_rpg/features/character/presentation/character_page.dart';
import 'package:arcadia_rpg/features/home/presentation/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

//final isLoggedIn = false;

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
        path: RouteName.character.path(),
        builder: (context, state) => CharacterPage(),
      ),
    ],
    redirect: (context, state) {
      return GoRouterGuard.instance.routeGuard(context, state, ref);
    },
  ),
);
