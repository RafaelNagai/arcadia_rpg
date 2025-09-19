import 'package:arcadia_rpg/core/route/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const ArcadiaApp()));
}

class ArcadiaApp extends ConsumerWidget {
  const ArcadiaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routeProvider);

    return MaterialApp.router(routerConfig: routeConfig);
  }
}
