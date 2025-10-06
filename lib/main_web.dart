import 'package:arcadia_rpg/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //web
  setUrlStrategy(PathUrlStrategy());
  runApp(ProviderScope(child: const ArcadiaApp()));
}
