import 'package:arcadia_rpg/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "env/.env");
  setUrlStrategy(PathUrlStrategy());
  runApp(ProviderScope(child: const ArcadiaApp()));
}
