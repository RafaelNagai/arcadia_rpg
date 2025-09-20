import 'package:flutter/material.dart';

class ArcadiaTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 87, 224, 199),
      brightness: Brightness.light,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 42, 108, 96),
      brightness: Brightness.dark,
    ),
  );
}
