import 'package:flutter/material.dart';

class FCommonColor {
  ///
  /// color primary
  ///
  static const primary = Colors.deepOrange;
  static const subPrimaryWhite = Colors.white;
  static const subPrimaryBlack = Color.fromARGB(255, 3, 3, 3);
  static const subPrimaryMattBlack = Color(0xFF121715);
  static const subPrimaryGodic = Color(0xFF191c1b);

  static Color subPrimaryMattBlackOpacity(double opacity) => const Color(0xFF121715).withOpacity(opacity);
  static Color subPrimaryGodicOpacity(double opacity) => const Color(0xFF191c1b).withOpacity(opacity);

  ///
  /// child primary
  ///
  static const feedIcon = Color.fromARGB(255, 181, 65, 30);
  static const fixedSnackBar = Color.fromARGB(255, 255, 146, 95);
  static const floatingSnackBar = Color.fromARGB(255, 255, 146, 95);
  static const heart = Colors.white;
  static const heartSelected = Color.fromARGB(255, 240, 84, 84);
  static Color heartOpacity(double opacity) => Colors.white.withOpacity(opacity);
  static Color heartSelectedOpacity(double opacity) => const Color.fromARGB(255, 240, 84, 84).withOpacity(opacity);
  static Color commentsIcon = Colors.white;

  static const Color button = primary;
  static Color opacityButton() => primary.withOpacity(0.5);
  static const Color opacityButtonTextColor = subPrimaryWhite;
  static Color textBoxColor() => subPrimaryWhite.withOpacity(0.3);
}
