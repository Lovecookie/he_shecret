import 'package:flutter/material.dart';

class FCommonColor {
  static const Color feedIcon = Color.fromARGB(255, 181, 65, 30);

  static const fixedSnackBar = Color.fromARGB(255, 255, 146, 95);
  static const floatingSnackBar = Color.fromARGB(255, 255, 146, 95);

  static const Color button = Colors.deepOrange;
  static const Color opacityButtonTextColor = Colors.white;

  static Color opacityButton() {
    return Colors.deepOrange.withOpacity(0.5);
  }

  static Color textBoxColor() {
    return Colors.white.withOpacity(0.3);
  }
}
