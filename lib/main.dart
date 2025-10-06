import 'package:arcadia_rpg/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Mobile
  runApp(ProviderScope(child: const ArcadiaApp()));
}
