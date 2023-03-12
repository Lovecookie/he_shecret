import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FCommonUIOverlayStyle {
  static void topStateBar({Color color = Colors.black}) {
    final mySystemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: color,
    );

    SystemChrome.setSystemUIOverlayStyle(mySystemUiOverlayStyle);
  }
}
