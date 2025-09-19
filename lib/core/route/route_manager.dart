import 'package:arcadia_rpg/core/route/route_name.dart';
import 'package:arcadia_rpg/features/home/presentation/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routeProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: [
      GoRoute(
        path: RouteName.home.path(),
        builder: (context, state) => HomePage(),
      ),
    ],
  ),
);
