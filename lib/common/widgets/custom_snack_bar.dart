import 'package:shipcret/material-theme/common_color.dart';

import 'package:flutter/material.dart';

class FCustomSnackBar {
  static fixedSnackBar(BuildContext context, String msg,
      {double height = 30, Color? fontColor, Color? backgroundColor}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: backgroundColor ?? FCommonColor.fixedSnackBar(0.7),
      content: Text(
        msg,
        style: TextStyle(
          color: fontColor ?? FCommonColor.subPrimaryWhite,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static floatingSnackBar(BuildContext context, String msg,
      {double height = 30, Color? fontColor, Color? backgroundColor, int? durationSec}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: backgroundColor ?? FCommonColor.floatingSnackBar(0.7),
      content: Text(
        msg,
        style: TextStyle(
          color: fontColor ?? FCommonColor.subPrimaryWhite,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      duration: Duration(seconds: durationSec ?? 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static popSnackBar(BuildContext context, String msg,
      {double height = 30, Color? fontColor, Color? backgroundColor, int? durationSec}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: backgroundColor ?? FCommonColor.floatingSnackBar(0.7),
      content: Text(
        msg,
        style: TextStyle(
          color: fontColor ?? FCommonColor.subPrimaryWhite,
        ),
      ),
      margin: const EdgeInsets.only(bottom: 400.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      duration: Duration(seconds: durationSec ?? 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
