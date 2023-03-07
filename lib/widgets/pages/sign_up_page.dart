import 'package:he_shecret/common/common_function.dart';
import 'package:he_shecret/common/route_wrapper.dart';
import 'package:he_shecret/common/widgets/custom_snack_bar.dart';
import 'package:he_shecret/widgets/common/common_string.dart';
import 'package:he_shecret/widgets/common/common_widget.dart';

import 'package:flutter/material.dart';

class FSignUpPage extends StatefulWidget {
  const FSignUpPage({
    super.key,
  });

  @override
  State<FSignUpPage> createState() => _FSignUpPageState();
}

class _FSignUpPageState extends State<FSignUpPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmController;

  final _fromGlobalKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FCommonWidget.appBarCenterTitle(
        FCommonString.signInSignIn,
        context: context,
        color: Colors.white.withOpacity(0.4),
        leadingIcon: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: ownerColorScheme(context).primary,
          ),
          onPressed: () {
            FAppRoute.pop(context);
          },
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SafeArea(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FCommonWidget.flatTextField(FCommonString.signUpName, controller: _nameController),
                FCommonWidget.flatTextField(FCommonString.signUpEmail, controller: _emailController, isEmail: true),
                FCommonWidget.flatTextField(FCommonString.signUpPassword,
                    controller: _passwordController, isPassword: true),
                FCommonWidget.flatTextField(FCommonString.signUpConfrimPassword,
                    controller: _confirmController, isPassword: true),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: FCommonWidget.submitButton(
                      context: context, label: FCommonString.signInSignIn, onPressed: () => _submitForm(context)),
                ),
              ],
            ),
          ),
        ));
      },
    ));
  }

  void _submitForm(BuildContext context) {
    if (_emailController.text.isEmpty) {
      FCustomSnackBar.fixedSnackBar(context, FCommonString.signUpPleaseEnterName);
      return;
    }
    if (_emailController.text.length > 27) {
      FCustomSnackBar.fixedSnackBar(context, FCommonString.signUpNameLengthCannotExceed27Character);
      return;
    }
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      FCustomSnackBar.fixedSnackBar(context, FCommonString.signUpPleaseFillFormCarefully);
      return;
    } else if (_passwordController.text != _confirmController.text) {
      FCustomSnackBar.fixedSnackBar(context, FCommonString.signUpPasswordAndConfirmPasswordDidNotMatch);
      return;
    }

    FAppRoute.go(context, FRouteName.playground);
  }
}
