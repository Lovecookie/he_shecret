import 'package:shipcret/common/common_assets.dart';
import 'package:shipcret/common/common_font.dart';
import 'package:shipcret/common/route_wrapper.dart';
import 'package:shipcret/common/widgets/background_image_widget.dart';
import 'package:shipcret/common/widgets/custom_snack_bar.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/providers/auth/auth_service.dart';
import 'package:shipcret/widgets/common/common_string.dart';
import 'package:shipcret/widgets/common/common_widget.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class FSignInPage extends ConsumerStatefulWidget {
  const FSignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FSignInPageState();
}

class _FSignInPageState extends ConsumerState<FSignInPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.text = 'smbaek@kakao.com';
    _passwordController.text = '1234';

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FCommonWidget.appBarCenterTitle(
        '',
        textStyle: const TextStyle(fontFamily: FCommonFont.family, fontSize: 20, color: Colors.white),
        context: context,
        color: Colors.transparent,
        elevation: 0.0,
        leadingIcon: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.white,
          ),
          onPressed: () {
            FAppRoute.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: FBackgroundBlurWidget(
        image: const AssetImage(FCommonAssets.dreamShip4),
        child: _body(context),
      ),
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
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              FCommonWidget.flatTextField(
                FCommonString.email,
                controller: _emailController,
                isEmail: true,
              ),
              FCommonWidget.flatTextField(
                FCommonString.password,
                controller: _passwordController,
                isPassword: true,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: FCommonWidget.submitButton(
                  context: context,
                  label: FCommonString.login,
                  color: FCommonColor.opacityButton(),
                  onPressed: () {
                    _onSubmit(context);
                  },
                ),
              )
            ]),
          ),
        ));
      },
    ));
  }

  void _onSubmit(BuildContext context) {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      FCustomSnackBar.floatingSnackBar(context, '이메일과 비밀번호를 입력해주세요.');
      return;
    }

    ref.read(authServiceProvider).setSignInInfo(email: _emailController.text, password: _passwordController.text);

    FAppRoute.go(context, FRouteName.playground);
  }
}
