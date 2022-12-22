import 'package:flutter/material.dart';

final mdGreenLight = ThemeData.from(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF616200),
    brightness: Brightness.light,
  ),
);

final md2baseline = ThemeData.from(
  useMaterial3: false,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    onBackground: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF000000),
    onSurface: Color(0xFF000000),
    primary: Color(0xFF6200EE),
    primaryContainer: Color(0xFF3700B3),
    secondary: Color(0xFF03DAC6),
    secondaryContainer: Color(0xFF018786),
    surface: Color(0xFFFFFFFF),
  ),
);
