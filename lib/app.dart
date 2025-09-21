import 'package:arcadia_rpg/core/route/route_manager.dart';
import 'package:arcadia_rpg/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArcadiaApp extends ConsumerWidget {
  const ArcadiaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeConfig = ref.watch(routeProvider);

    return MaterialApp.router(
      routerConfig: routeConfig,
      theme: ArcadiaTheme.light,
      darkTheme: ArcadiaTheme.dark,
      themeMode: ThemeMode.system,
    );
  }
}
