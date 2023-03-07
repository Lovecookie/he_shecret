import 'package:shipcret/common/common_function.dart';
import 'package:shipcret/widgets/common/custom_text_field.dart';
import 'package:shipcret/widgets/common/flat_button.dart';
import 'package:shipcret/widgets/custom_widget.dart';

import 'package:flutter/material.dart';

class FCommonWidget {
  static Widget flatTextField(
    String hintText, {
    required TextEditingController controller,
    bool isEmail = false,
    bool isPassword = false,
  }) {
    return FCustomTextField(
      editingController: controller,
      isEmail: isEmail,
      isPassword: isPassword,
      hintText: hintText,
    );
  }

  static Widget submitButton(
      {required BuildContext context,
      required String label,
      required void Function() onPressed,
      Color? color,
      EdgeInsetsGeometry? padding}) {
    return FFlatButton(
      label: label,
      onPressed: onPressed,
      borderRadius: 30,
      color: color,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    );
  }

  static AppBar appBarCenterTitle(
    String title, {
    required BuildContext context,
    Widget? leadingIcon,
    List<Widget>? actionWidgets,
    Color? color,
  }) {
    return AppBar(
      centerTitle: true,
      title: customText(
        title,
        context: context,
        style: TextStyle(fontSize: 20, color: ownerColorScheme(context).primary),
      ),
      backgroundColor: color,
      leading: leadingIcon,
      actions: actionWidgets,
    );
  }
}
