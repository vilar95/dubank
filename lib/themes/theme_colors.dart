import 'package:flutter/material.dart';

class ThemeColors {
  static const MaterialColor primaryColor = Colors.cyan;
  static const List<Color> headerGradient = [
    Color.fromRGBO(27, 23, 155, 1.0),
    Color.fromRGBO(27, 23, 155, 1.0),
    Color.fromRGBO(38, 109, 139, 1.0),
    Color.fromRGBO(79, 197, 134, 1.0)
  ];
  static const recentActivity = {
    'spent': Color.fromRGBO(255, 137, 29, 1.0),
    'earned': Colors.cyan,
  };
  static const MaterialColor division = Colors.grey;
  // ignore: constant_identifier_names
  static const AccountPoints = {
    'delivery': Color.fromRGBO(62, 206, 216, 1.0),
    'streaming': Color.fromRGBO(75, 89, 191, 1.0),
  };
}