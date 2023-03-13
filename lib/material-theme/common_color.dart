import 'package:flutter/material.dart';

class FCommonColor {
  ///
  /// color primary
  ///
  static const primary = Colors.deepOrange;
  static const subPrimaryWhite = Colors.white;
  static const subPrimaryBlack = Color.fromARGB(255, 3, 3, 3);
  static const mattBlack = Color(0xFF121715);
  static const godic = Color(0xFF191c1b);
  static const greyYellow = Color(0xFFf5f5f5);

  static Color mattBlackOpacity(double opacity) => const Color(0xFF121715).withOpacity(opacity);
  static Color godicOpacity(double opacity) => const Color(0xFF191c1b).withOpacity(opacity);
  static Color greyYeellowOpacity(double opacity) => const Color(0xFFf5f5f5).withOpacity(opacity);

  ///
  /// child primary
  ///
  static const feedIcon = Color.fromARGB(255, 181, 65, 30);
  static Color fixedSnackBar(double opacity) => subPrimaryBlack.withOpacity(opacity);
  static Color floatingSnackBar(double opacity) => subPrimaryBlack.withOpacity(opacity);
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
