import 'package:estilizacao_componentes/themes/theme_colors.dart';
import 'package:flutter/material.dart';
// ignore: non_constant_identifier_names
ThemeData myTheme = ThemeData(
  primaryColor: ThemeColors.primaryColor,
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: ThemeColors.primaryColor,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  ),
);
